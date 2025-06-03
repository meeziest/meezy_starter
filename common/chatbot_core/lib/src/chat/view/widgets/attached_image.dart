import 'package:chatbot_core/src/chat/util.dart';
import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

class AttachedImage extends StatelessWidget {
  const AttachedImage({
    super.key,
    this.onRemove,
  });

  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 64.h * 2,
          width: 40.h * 2,
          decoration: BoxDecoration(
            color: context.colorScheme.primaryBackground,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkResponse(
            onTap: onRemove,
            child: const Center(
              child: Icon(Icons.close_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
