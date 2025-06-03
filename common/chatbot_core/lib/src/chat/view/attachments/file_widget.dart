import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

import '../../../domain/domain.dart';

class FileWidget extends StatelessWidget {
  final FileMessageEntity attachment;
  final bool isLoading;
  final bool isRemovable;
  final VoidCallback? onRemove;

  const FileWidget({
    required this.attachment,
    this.isRemovable = false,
    this.isLoading = false,
    super.key,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(color: context.colorScheme.secondary),
        color: context.colorScheme.primary,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isLoading)
                    const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          strokeCap: StrokeCap.round,
                          color: Colors.white,
                        ))
                  else
                    const Icon(CupertinoIcons.folder_open, size: 24),
                  const WBox(8.0),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (attachment.fileName != null)
                          Text(
                            attachment.fileName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyles.bodyMedium,
                          ),
                        if (attachment.fileName != null)
                          Text(
                            attachment.fileName.toString().split('.').last.toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyles.bodyMedium?.copyWith(color: context.colorScheme.tertiary),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isRemovable)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 6.0, top: 6.0),
                child: GestureDetector(
                  onTap: onRemove,
                  child: const Icon(CupertinoIcons.xmark_circle_fill, size: 24),
                ),
              ),
            )
        ],
      ),
    );
  }
}
