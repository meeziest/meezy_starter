library focused_menu;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

import 'custom_color_selection_control.dart';

class FocusedMenuHolder extends StatefulWidget {
  final Widget child;
  final double? menuItemExtent;
  final double? menuWidth;
  final List<FocusedMenuItem> menuItems;
  final bool? animateMenuItems;
  final BoxDecoration? menuBoxDecoration;
  final Function onPressed;
  final Duration? duration;
  final double? blurSize;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;

  /// Open with tap insted of long press.
  final bool openWithTap;

  const FocusedMenuHolder({
    required this.child,
    required this.onPressed,
    required this.menuItems,
    super.key,
    this.duration,
    this.menuBoxDecoration,
    this.menuItemExtent,
    this.animateMenuItems,
    this.blurSize,
    this.blurBackgroundColor,
    this.menuWidth,
    this.bottomOffsetHeight,
    this.menuOffset,
    this.openWithTap = false,
  });

  @override
  _FocusedMenuHolderState createState() => _FocusedMenuHolderState();
}

class _FocusedMenuHolderState extends State<FocusedMenuHolder> {
  GlobalKey containerKey = GlobalKey();
  Offset childOffset = const Offset(0, 0);
  Size? childSize;
  bool isSelected = false;
  bool isSelectableText = false;

  getOffset() {
    final RenderBox renderBox = containerKey.currentContext!.findRenderObject()! as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    setState(() {
      childOffset = Offset(offset.dx, offset.dy);
      childSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: containerKey,
        onTap: () async {
          widget.onPressed();
          if (widget.openWithTap) {
            await openMenu(context);
          }
        },
        onLongPress: () async {
          setState(() {
            isSelected = true;
          });
          if (!widget.openWithTap) {
            await openMenu(context);
            setState(() {
              isSelected = false;
              isSelectableText = false;
            });
          }
        },
        child: isSelected ? const SizedBox() : widget.child);
  }

  Future openMenu(BuildContext context) async {
    getOffset();
    await Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: widget.duration ?? const Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) {
              animation = Tween(begin: 0.0, end: 1.0).animate(animation);
              return FadeTransition(
                  opacity: animation,
                  child: FocusedMenuDetails(
                      itemExtent: widget.menuItemExtent,
                      menuBoxDecoration: widget.menuBoxDecoration,
                      childOffset: childOffset,
                      childSize: childSize,
                      menuItems: widget.menuItems,
                      blurSize: widget.blurSize,
                      menuWidth: widget.menuWidth,
                      blurBackgroundColor: widget.blurBackgroundColor,
                      animateMenu: widget.animateMenuItems ?? true,
                      bottomOffsetHeight: widget.bottomOffsetHeight ?? 0,
                      menuOffset: widget.menuOffset ?? 0,
                      child: SelectionArea(
                        selectionControls: CustomColorSelectionHandle(context.colorScheme.primary),
                        child: widget.child,
                      )));
            },
            fullscreenDialog: true,
            opaque: false));
  }
}

class FocusedMenuDetails extends StatelessWidget {
  final List<FocusedMenuItem> menuItems;
  final BoxDecoration? menuBoxDecoration;
  final Offset childOffset;
  final double? itemExtent;
  final Size? childSize;
  final Widget child;
  final bool animateMenu;
  final double? blurSize;
  final double? menuWidth;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;

  const FocusedMenuDetails(
      {required this.menuItems,
      required this.child,
      required this.childOffset,
      required this.childSize,
      required this.menuBoxDecoration,
      required this.itemExtent,
      required this.animateMenu,
      required this.blurSize,
      required this.blurBackgroundColor,
      required this.menuWidth,
      super.key,
      this.bottomOffsetHeight,
      this.menuOffset});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final maxMenuHeight = size.height * 0.45;
    final listHeight = menuItems.length * (itemExtent ?? 50.0) + (menuItems.length - 1);

    final maxMenuWidth = menuWidth ?? (size.width * 0.70);
    final menuHeight = listHeight < maxMenuHeight ? listHeight : maxMenuHeight;
    final leftOffset = (childOffset.dx + maxMenuWidth) < size.width
        ? childOffset.dx
        : (childOffset.dx - maxMenuWidth + childSize!.width);
    final topOffset = (childOffset.dy + menuHeight + childSize!.height) < size.height - bottomOffsetHeight!
        ? childOffset.dy + childSize!.height + menuOffset!
        : childOffset.dy - menuHeight - menuOffset!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurSize ?? 4, sigmaY: blurSize ?? 4),
                child: Container(
                  color: (blurBackgroundColor ?? Colors.black).withOpacity(0.7),
                ),
              )),
          Positioned(
            top: topOffset,
            left: leftOffset,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 200),
              builder: (BuildContext context, value, Widget? child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              tween: Tween(begin: 0.0, end: 1.0),
              child: Container(
                width: maxMenuWidth,
                height: menuHeight,
                decoration: menuBoxDecoration ??
                    BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 1)]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: ListView.separated(
                    itemCount: menuItems.length,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      color: Color(0xff404143),
                    ),
                    itemBuilder: (context, index) {
                      final FocusedMenuItem item = menuItems[index];
                      final Widget listItem = GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            item.onPressed();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: itemExtent ?? 50.0,
                              decoration: BoxDecoration(
                                color: item.backgroundColor ?? Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    item.title,
                                    if (item.trailingIcon != null) ...[item.trailingIcon!]
                                  ],
                                ),
                              )));
                      if (animateMenu) {
                        return TweenAnimationBuilder(
                            builder: (context, value, child) {
                              return Transform(
                                transform: Matrix4.rotationX(1.5708 * value),
                                alignment: Alignment.bottomCenter,
                                child: child,
                              );
                            },
                            tween: Tween(begin: 1.0, end: 0.0),
                            duration: Duration(milliseconds: index * 200),
                            child: listItem);
                      } else {
                        return listItem;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: childOffset.dy,
              left: childOffset.dx,
              child: SizedBox(width: childSize!.width, height: childSize!.height, child: child)),
        ],
      ),
    );
  }
}

class FocusedMenuItem {
  Color? backgroundColor;
  Widget title;
  Widget? trailingIcon;
  Function onPressed;

  FocusedMenuItem({required this.title, required this.onPressed, this.backgroundColor, this.trailingIcon});
}
