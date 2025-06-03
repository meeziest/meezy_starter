import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.attachment,
    this.isLoading = false,
    this.isRemovable = false,
    this.onRemove,
    this.width,
    this.height,
    super.key,
  });

  final VoidCallback? onRemove;
  final bool isLoading;
  final bool isRemovable;
  final double? width;
  final double? height;
  final FileMessageEntity attachment;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (attachment.path != null) {
      child = Image.file(
        File(attachment.path!),
        fit: BoxFit.cover,
      );
    } else if (attachment.bytes != null) {
      child = Image.memory(
        attachment.bytes!,
        fit: BoxFit.cover,
      );
    }
    return Stack(children: [
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: SizedBox(height: height, width: width, child: child)),
            if (isLoading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  strokeCap: StrokeCap.round,
                  color: Colors.white,
                ),
              ),
            if (isRemovable)
              Positioned(
                right: 4,
                top: 4,
                child: GestureDetector(
                  onTap: onRemove,
                  child: const Icon(CupertinoIcons.xmark_circle_fill, size: 24),
                ),
              )
          ],
        ),
      ),
    ]);
  }
}
