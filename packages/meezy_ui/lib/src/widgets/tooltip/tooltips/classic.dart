import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

/// [ClassicTooltip] is a customizable tooltip widget that displays additional
/// information when the user hovers over or taps on a child widget.
///
/// It supports various configurations like custom content, positioning,
/// arrow indicators, modal backgrounds, and more.
class ClassicTooltip extends StatefulWidget {
  /// Creates a [ClassicTooltip].
  ///
  /// The [content] and [child] arguments must not be null.
  const ClassicTooltip({
    super.key,
    required this.content,
    required this.child,
    required this.controller,
    this.showArrow = true,
    this.color,
    this.distance = 0.0,
    this.padding,
    this.position = TooltipPosition.topCenter,
    this.radius = 8.0,
    this.showModal = false,
    this.closable = true,
    this.autoFit = false,
    this.showOnLongPress = false,
    this.duration = const Duration(milliseconds: 300),
    this.clipBehavior,
    this.boxShadow,
    this.extraOffsetTop,
    this.extraOffsetLeft,
    this.maxWidth,
  });

  /// The widget to which the tooltip is attached.
  final Widget child;

  /// Whether to show an arrow pointing to the [child].
  final bool showArrow;

  /// Whether the tooltip can be closed by tapping outside of it.
  final bool closable;

  /// Whether to show the tooltip on a long press instead of a tap.
  final bool showOnLongPress;

  /// The controller that manages the tooltip's visibility.
  final ToolTipController controller;

  /// The background color of the tooltip.
  final Color? color;

  /// The content displayed inside the tooltip.
  final Widget content;

  /// The distance between the tooltip and the [child].
  final double distance;

  /// The padding around the [content] inside the tooltip.
  final EdgeInsets? padding;

  /// The preferred position of the tooltip relative to the [child].
  final TooltipPosition position;

  /// The radius of the tooltip's corners.
  final double radius;

  /// Whether to show a modal background behind the tooltip.
  final bool showModal;

  /// Whether the tooltip should automatically adjust its position to fit within the screen.
  final bool autoFit;

  /// The duration of the tooltip's show/hide animation.
  final Duration duration;

  /// The clipping behavior of the tooltip.
  final Clip? clipBehavior;

  /// The box shadow displayed behind the tooltip.
  final BoxShadow? boxShadow;

  /// Extra vertical offset for the tooltip position.
  final double? extraOffsetTop;

  /// Extra horizontal offset for the tooltip position.
  final double? extraOffsetLeft;

  /// The maximum width of the tooltip.
  final double? maxWidth;

  @override
  State<ClassicTooltip> createState() => _ClassicTooltipState();
}

class _ClassicTooltipState extends State<ClassicTooltip> with WidgetsBindingObserver {
  /// Dimensions for the arrow indicator.
  final ElementBox _arrowBox = ElementBox(h: 10.0, w: 16.0);

  /// Dimensions for the tooltip overlay, initialized after layout.
  ElementBox _overlayBox = ElementBox(h: 0.0, w: 0.0);

  /// An [OverlayEntry] used to measure the tooltip size before displaying.
  OverlayEntry? _overlayEntryHidden;

  /// A [GlobalKey] used to identify the tooltip widget for size measurement.
  final GlobalKey _widgetKey = GlobalKey();

  /// Returns the current screen size.
  ElementBox get _screenSize => _getScreenSize();

  /// Returns the size and position of the trigger widget.
  ElementBox get _triggerBox => _getTriggerSize();

  @override
  void initState() {
    super.initState();
    widget.controller.inject(_showOverlay);
    widget.controller.showModal = widget.showModal;
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadHiddenOverlay(context));
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didUpdateWidget(covariant ClassicTooltip oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.controller.inject(_showOverlay);

    if (widget.showModal != oldWidget.showModal) {
      widget.controller.showModal = widget.showModal;
    }
  }

  @override
  void didChangeMetrics() {
    // Hide the tooltip when screen metrics change (e.g., rotation).
    widget.controller.closeToolTip();
    super.didChangeMetrics();
  }

  @override
  Future<bool> didPushRoute(String route) {
    // Hide the tooltip when a new route is pushed.
    widget.controller.closeToolTip(force: true);
    // ignore: deprecated_member_use
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    // Hide the tooltip when the current route is popped.
    widget.controller.closeToolTip(force: true);
    return super.didPopRoute();
  }

  /// Calculates the size of the hidden tooltip.
  void _getHiddenOverlaySize(BuildContext context) {
    final RenderBox? box = _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null && mounted) {
      setState(() {
        _overlayBox = ElementBox(
          w: box.size.width,
          h: box.size.height,
        );
        _overlayEntryHidden?.remove();
      });
    }
  }

  /// Creates an invisible overlay to measure the tooltip's size.
  void _loadHiddenOverlay(BuildContext context) {
    final OverlayState overlayStateHidden = Overlay.of(context);
    _overlayEntryHidden = OverlayEntry(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _getHiddenOverlaySize(context));
        return Opacity(
          opacity: 0,
          child: Center(
            child: _buildBubble(
              key: _widgetKey,
              child: widget.content,
            ),
          ),
        );
      },
    );

    overlayStateHidden.insert(_overlayEntryHidden!);
  }

  /// Gets the size and position of the trigger widget.
  ElementBox _getTriggerSize() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final offset = renderBox.localToGlobal(Offset.zero);
      return ElementBox(
        w: renderBox.size.width,
        h: renderBox.size.height,
        x: offset.dx,
        y: offset.dy,
      );
    }
    return ElementBox(w: 0, h: 0);
  }

  /// Gets the current screen size.
  ElementBox _getScreenSize() {
    return ElementBox(
      w: MediaQuery.of(context).size.width,
      h: MediaQuery.of(context).size.height,
    );
  }

  /// Shows the tooltip overlay.
  Future<void> _showOverlay(BuildContext context) async {
    final ToolTipElementsDisplay toolTipElementsDisplay = PositionManager(
      arrowBox: _arrowBox,
      overlayBox: _overlayBox,
      triggerBox: _triggerBox,
      screenSize: _screenSize,
      distance: widget.distance,
      radius: widget.radius,
      autoFitScreen: widget.autoFit,
    ).load(preferredPosition: widget.position);

    widget.controller.updateAndShowOverlay(
      context,
      bubbleEntry: _buildBubbleOverlay(toolTipElementsDisplay),
    );
  }

  /// Builds the tooltip bubble overlay.
  OverlayEntry _buildBubbleOverlay(
    ToolTipElementsDisplay toolTipElementsDisplay,
  ) {
    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Modal
            TapRegion(
              onTapInside: (_) => _tapCallback(),
              onTapOutside: (_) => _tapCallback(),
              child: Modal(
                opacity: 0.5,
                color: Colors.black87,
                visible: widget.controller.showModal,
                onTap: widget.controller.closeToolTip,
              ),
            ),

            // Shadow
            _buildShadow(toolTipElementsDisplay),

            // Bubble
            _buildPositionedBubble(toolTipElementsDisplay),
          ],
        );
      },
    );
  }

  /// Builds the shadow for the tooltip.
  Widget _buildShadow(ToolTipElementsDisplay toolTipElementsDisplay) {
    return Positioned(
      top: toolTipElementsDisplay.bubble.y - 15 + (widget.extraOffsetTop ?? 0),
      left: toolTipElementsDisplay.bubble.x - 15 + (widget.extraOffsetLeft ?? 0),
      child: AnimatedCrossClip(
        crossClipState: widget.controller.shown ? CrossClipState.unmask : CrossClipState.mask,
        duration: widget.controller.animationDuration,
        pathBuilder: PathBuilders.circleOut,
        position: toolTipElementsDisplay.position,
        curve: Curves.easeInOut,
        child: Container(
          height: toolTipElementsDisplay.bubble.h,
          width: toolTipElementsDisplay.bubble.w,
          margin: const EdgeInsets.only(bottom: 50, right: 35, left: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              widget.radius,
            ),
            boxShadow: [
              widget.boxShadow ??
                  BoxShadow(
                    blurRadius: 10.0,
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: const Offset(-10, 30),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the positioned tooltip bubble.
  Widget _buildPositionedBubble(ToolTipElementsDisplay toolTipElementsDisplay) {
    return Positioned(
      top: toolTipElementsDisplay.bubble.y + (widget.extraOffsetTop ?? 0),
      left: toolTipElementsDisplay.bubble.x + (widget.extraOffsetLeft ?? 0),
      child: AnimatedCrossClip(
        crossClipState: widget.controller.shown ? CrossClipState.unmask : CrossClipState.mask,
        duration: widget.controller.animationDuration,
        pathBuilder: PathBuilders.circleOut,
        position: toolTipElementsDisplay.position,
        curve: Curves.easeInOut,
        child: _buildBubble(
          child: widget.content,
          position: toolTipElementsDisplay.position,
        ),
      ),
    );
  }

  /// Builds the bubble container for the tooltip content.
  Widget _buildBubble({
    Key? key,
    required Widget child,
    TooltipPosition? position,
  }) {
    return Bubble(
      key: key,
      padding: widget.padding,
      radius: BorderRadius.circular(widget.radius),
      color: widget.color ?? context.colorScheme.primaryContainer,
      position: position ?? widget.position,
      clipBehavior: widget.clipBehavior,
      tail: widget.showArrow
          ? ArrowTail(
              color: widget.color ?? context.colorScheme.primaryContainer,
              position: position ?? widget.position,
            )
          : null,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: widget.showOnLongPress ? _tapCallback : null,
      onTap: widget.showOnLongPress ? null : _tapCallback,
      child: widget.child,
    );
  }

  /// Handles tap or long-press events to show/hide the tooltip.
  Future<void> _tapCallback() async {
    if (widget.controller.shown && widget.closable) {
      await widget.controller.closeToolTip();
    } else {
      await _showOverlay(context);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
