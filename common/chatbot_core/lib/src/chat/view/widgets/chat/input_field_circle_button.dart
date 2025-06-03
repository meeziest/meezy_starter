import 'package:flutter/material.dart';

class InputFieldCircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;
  final Widget? child;
  const InputFieldCircleButton({
     required this.color, this.onTap,
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
