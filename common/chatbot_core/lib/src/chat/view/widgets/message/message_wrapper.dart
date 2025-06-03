// Flutter imports:
import 'package:chatbot_core/src/chat/util.dart';
import 'package:chatbot_core/src/chat/view/widgets/defined_height_widget.dart';
import 'package:chatbot_core/src/chat/view/widgets/message/typing_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:meezy_ui/meezy_ui.dart' as SmartDialogs;
import 'package:meezy_ui/meezy_ui.dart';

import '../../../../domain/domain.dart';
import '../chat/focused_menu.dart';
import 'blinking_type_indicator.dart';

class MessageWrapper extends DefinedHeightStatelessWidget {
  const MessageWrapper({
    required this.message,
    this.onTypingEnd,
    this.scrollController,
    this.isTyping = false,
    super.key,
  });

  /// Отступы внутри виджета.
  static final EdgeInsets contentPadding = EdgeInsets.only(left: 12.w, right: 12.w, top: 6.h, bottom: 8.h);
  static final EdgeInsets responsePadding = EdgeInsets.only(left: 5.w, right: 12.w);
  static final EdgeInsets placeholderPadding = EdgeInsets.only(left: 5.w, right: 12.w, top: 2.h);

  /// Максимальная ширина сообщения.
  static final double maxWidth = 250.w;

  /// Отступ между сообщением и вложением.
  static final double spaceBetweenMessageAndAttachment = 10.h;

  /// Сообщение.
  final MessageEntity message;

  /// Контроллер скролла.
  final ScrollController? scrollController;

  /// On typing end callback.
  final VoidCallback? onTypingEnd;

  final bool isTyping;

  /// Мое сообщение или нет.
  bool get my => message.role == ChatRole.user;

  Widget? _buildText(BuildContext context) {
    return Text(
      message.content.text,
      style: context.textStyles.headlineSmall,
    );
  }

  Widget _buildContent(BuildContext context) {
    if (my) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // if (message.images.isNotEmpty) ...[
            //   MessageImageAttachments(attachments: message.images),
            //   SizedBox(height: spaceBetweenMessageAndAttachment),
            // ],
            // if (message.files.isNotEmpty) ...[
            //   MessageFileAttachments(attachments: message.files),
            //   SizedBox(height: spaceBetweenMessageAndAttachment),
            // ],
            if (message.content.text.isNotEmpty)
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: context.colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SizedBox(
                  child: Padding(
                    padding: contentPadding,
                    child: _buildText(context),
                  ),
                ),
              )
          ],
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(CupertinoIcons.alt),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          child: Padding(
            padding: responsePadding,
            child: _getChatResponseWidget(context),
          ),
        ),
      ],
    );
  }

  Widget _getChatResponseWidget(BuildContext context) {
    final text = message.content.text;
    if (message.generating) {
      return Padding(
        padding: placeholderPadding,
        child: const BlinkingTypeIndicator(),
      );
    } else if (isTyping) {
      return Padding(
        padding: responsePadding,
        child: TypingMessageWidget(
          message: text,
          textStyle: context.textStyles.headlineSmall,
          onTypingEnd: onTypingEnd,
          scrollController: scrollController,
        ),
      );
    }

    return Padding(
      padding: responsePadding,
      child: _buildText(context) ?? const SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (my ? Alignment.centerRight : Alignment.centerLeft),
      child: FocusedMenuHolder(
          blurBackgroundColor: context.colorScheme.primaryBackground,
          onPressed: () {},
          menuWidth: 220,
          menuOffset: 12.0,
          menuItemExtent: 44.0,
          menuBoxDecoration: BoxDecoration(
            color: const Color(0xff252525).withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          menuItems: [
            FocusedMenuItem(
              backgroundColor: const Color(0xff252525).withOpacity(0.5),
              trailingIcon: const Icon(CupertinoIcons.doc, size: 24),
              title: const Text(
                'Copy',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400, height: 22 / 17.0),
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: message.content.text ?? ''));
                // SmartDialogs.showNotify(
                //   msg: 'Message copied',
                //   notifyType: NotifyType.warning,
                // );
              },
            ),
          ],
          child: _buildContent(context)),
    );
  }

  /// Высота текста.
  double get textHeight {
    final double maxWidthForText = maxWidth - contentPadding.horizontal;
    final text = message.content.text;
    if (text.isEmpty) return 0;
    return getTextWidgetSize(
            text,
            const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
            maxWidth: maxWidthForText)
        .height;
  }

  @override
  double get height {
    final double calculatedHeight = contentPadding.vertical + textHeight;

    return calculatedHeight;
  }
}
