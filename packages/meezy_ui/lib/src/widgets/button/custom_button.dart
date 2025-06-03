import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final OutlinedBorder? shape;

  const CustomButton({
    required this.title,
    required this.onPressed,
    super.key,
    this.backgroundColor,
    this.textColor,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: backgroundColor ?? context.colorScheme.primaryBackground,
        shape: shape,
      ),
      child: Text(
        title,
        style: context.textStyles.bodyMedium?.copyWith(
          color: textColor ?? context.colorScheme.primaryBackground,
        ),
      ),
    );
  }
}
