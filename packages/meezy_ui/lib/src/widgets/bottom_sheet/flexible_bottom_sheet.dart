import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';
import 'package:meezy_ui/src/widgets/bottom_sheet/flexible_bottom_sheet_header.dart';
import 'package:meezy_ui/src/widgets/puller.dart';

import 'flexible_bottom_sheet_arguments.dart';

class FlexibleBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    FlexibleBottomSheetArguments? arguments,
    bool? useRootNavigator,
  }) {
    return showModalBottomSheet<T?>(
      context: context,
      backgroundColor: context.colorScheme.primaryBackground,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      elevation: 0,
      builder: (dialogContext) {
        return PopScope(
          onPopInvokedWithResult: (value, result) {
            if (value && result == null) {
              arguments?.onClose?.call();
            }
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: context.mounted ? context.mq.viewInsets.bottom : 0.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    const Puller(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: FlexibleBottomSheetHeader(
                        title: arguments?.title,
                        onClose: arguments?.onClose,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      arguments?.center ?? const SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: arguments?.bottom != null ? arguments?.bottom!(dialogContext) : const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
