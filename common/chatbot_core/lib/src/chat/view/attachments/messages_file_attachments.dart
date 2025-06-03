import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

import '../../../domain/domain.dart';
import 'file_widget.dart';

class MessageFileAttachments extends StatelessWidget {
  const MessageFileAttachments({
    super.key,
    required this.attachments,
  });

  final List<FileMessageEntity> attachments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => FileWidget(attachment: attachments[index]),
        separatorBuilder: (context, index) => const HBox(8.0),
        itemCount: attachments.length);
  }
}
