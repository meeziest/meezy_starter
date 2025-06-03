import 'package:flutter/material.dart';

import '../../meezy_ui.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationType type;
  final String? title;
  final String? subtitle;
  final VoidCallback? onClose;
  final CrossAxisAlignment popUpAlignment;
  final Widget Function(Color color, double size)? iconBuilder;
  final TextStyle? titleTextStyle;
  final Alignment? stackAlignment;

  const NotificationWidget({
    required this.type,
    required this.onClose,
    super.key,
    this.iconBuilder,
    this.title,
    this.subtitle,
    this.titleTextStyle,
    this.stackAlignment,
    this.popUpAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colorScheme.surface),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 8,
            color: context.colorScheme.shadow,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Stack(
        alignment: stackAlignment ?? AlignmentDirectional.topStart,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: type.getColor(context),
                        shape: BoxShape.circle,
                      ),
                      child: type.buildIcon(context),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (title != null)
                          Text(
                            title!,
                            style: context.textStyles.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: context.textStyles.labelMedium,
                          ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          if (onClose != null)
            Positioned(
              right: 16,
              top: 16,
              child: GestureDetector(
                onTap: () => onClose!(),
                child: const Icon(Icons.close),
              ),
            ),
        ],
      ),
    );
  }
}

enum NotificationType {
  info,
  error,
  success,
  warning,
  loading,
  custom,
}

extension NotificationTypeX on NotificationType {
  Color? getColor(BuildContext context) {
    switch (this) {
      case NotificationType.success:
        return const Color(0xFF4CAF50); // Green700
      case NotificationType.error:
        return const Color(0xFFF44336); // Error (Red)
      case NotificationType.info:
        return const Color(0xFF2196F3); // Blue700
      case NotificationType.warning:
        return const Color(0xFFFF9800); // Orange700
      default:
        return const Color(0xFF757575); // Neutral700 (Gray)
    }
  }

  Widget buildIcon(BuildContext context) {
    return switch (this) {
      NotificationType.success => const Icon(Icons.check),
      NotificationType.error => const Icon(Icons.error),
      NotificationType.info => const Icon(Icons.info),
      NotificationType.warning => const Icon(Icons.warning),
      _ => const Icon(Icons.info),
    };
  }
}
