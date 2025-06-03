import 'package:chatbot_core/src/chat/view/attachments/image_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

const _oneImageSize = Size(100, 100);

class MessageImageAttachments extends StatelessWidget {
  const MessageImageAttachments({
    required this.attachments,
    super.key,
  });

  final List<FileMessageEntity> attachments;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: attachments.length == 3
          ? Row(
              children: List.generate(3, (colIndex) {
                return Padding(
                  padding: EdgeInsets.only(right: colIndex != 3 ? 4.0 : 0.0),
                  child: ClipRRect(
                    borderRadius: _getBorderRadius(
                      isLast: colIndex == 2,
                      isSingle: attachments.length == 1,
                    ),
                    child: _buildImage(attachments[colIndex]),
                  ),
                );
              }),
            )
          : _buildImages(),
    );
  }

  Widget _buildImages() {
    final int rowCount = (attachments.length / 2).ceil();
    final int lastRowItemCount = attachments.length.isEven ? 2 : 1;

    return Column(
      children: List.generate(rowCount, (rowIndex) {
        final int columnCount = (rowIndex == rowCount - 1) ? lastRowItemCount : 2;
        return Padding(
          padding: EdgeInsets.only(bottom: rowIndex != rowCount - 1 ? 4.0 : 0.0),
          child: Row(
            children: List.generate(columnCount, (colIndex) {
              final actualIndex = rowIndex * 2 + colIndex;
              return Padding(
                padding: EdgeInsets.only(right: colIndex != columnCount ? 4.0 : 0.0),
                child: ClipRRect(
                  borderRadius: _getBorderRadius(
                    isLast: colIndex == columnCount - 1,
                    isSingle: attachments.length == 1,
                  ),
                  child: _buildImage(attachments[actualIndex]),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  BorderRadiusGeometry _getBorderRadius({bool isLast = false, bool isSingle = false}) {
    if (isSingle) {
      return const BorderRadius.all(Radius.circular(16.0));
    }
    if (isLast) {
      return const BorderRadius.only(
        topRight: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
      );
    }
    return const BorderRadius.only(
      topLeft: Radius.circular(16.0),
      bottomLeft: Radius.circular(16.0),
    );
  }

  Widget _buildImage(FileMessageEntity attachment) {
    return ImageWidget(
      attachment: attachment,
      height: _oneImageSize.height,
      width: _oneImageSize.width,
    );
  }
}
