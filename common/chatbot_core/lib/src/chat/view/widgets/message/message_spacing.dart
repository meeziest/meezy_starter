import 'package:flutter/material.dart';

import 'package:chatbot_core/src/chat/view/widgets/defined_height_widget.dart';

class MessageSpacing extends DefinedHeightStatelessWidget {
  const MessageSpacing({
    required this.spacing,
    super.key,
  });

  /// Размер вертикального отступа.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacing);
  }

  @override
  double get height => spacing;
}
