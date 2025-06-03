import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

class FlexibleBottomSheetHeader extends StatelessWidget {
  final String? title;
  final VoidCallback? onClose;

  const FlexibleBottomSheetHeader({this.title, super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: title != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
      children: [
        if (title != null) Text(title!, style: context.textStyles.headlineMedium),
        GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              onClose?.call();
              context.router.maybePop();
            },
            child: const Icon(Icons.close)),
      ],
    );
  }
}
