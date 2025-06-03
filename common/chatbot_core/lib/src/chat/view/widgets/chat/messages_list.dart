import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

import '../../../../../chatbot_core.dart';
import '../../../../domain/domain.dart';

class ChatMessagesList extends StatefulWidget {
  const ChatMessagesList({
    required this.chat,
    this.scrollController,
    super.key,
  });

  final ScrollController? scrollController;
  final ChatEntity chat;

  @override
  State<ChatMessagesList> createState() => _ChatMessagesListState();
}

class _ChatMessagesListState extends State<ChatMessagesList> {
  bool isSubscribed = false;
  bool isScrollingManually = false;
  bool isTyping = false;
  bool hasNewMessage = false;

  late List<MessageEntity> messages;

  @override
  void initState() {
    super.initState();

    messages = widget.chat.messages;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.scrollController == null) return;
      if (widget.scrollController!.hasClients) {
        widget.scrollController!.jumpTo(
          widget.scrollController!.position.maxScrollExtent,
        );
      }
    });
  }

  @override
  void didUpdateWidget(covariant ChatMessagesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.chat.messages.length != widget.chat.messages.length) {
      hasNewMessage = true;
      messages = widget.chat.messages;
    }
  }

  @override
  void didChangeDependencies() {
    isSubscribed = false; //todo SubscriptionStatusScopeModel.of(context)?.isSubscribed ?? false;
    // SubscriptionStatusScopeModel.of(context)?.isSubscribed ?? false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (messages.isNotEmpty) {
      final suggestions = messages.last.nextSuggestions;
      final isLoading = messages.last.generating || isTyping;

      return NotificationListener<TypingNotification>(
        onNotification: (notification) {
          setState(() {
            isTyping = notification.isTyping;
            if (!isTyping) hasNewMessage = false;
          });
          return false;
        },
        child: Listener(
          onPointerDown: (_) => setState(() => isScrollingManually = true),
          onPointerUp: (_) => setState(() => isScrollingManually = false),
          child: ScrollControlInherited(
            isScrollControlledManually: isScrollingManually,
            child: ListView.separated(
              controller: widget.scrollController,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              separatorBuilder: (context, index) {
                final message = messages[index];
                if (message.role == ChatRole.system) return const SizedBox();
                return MessageSpacing(spacing: 8.h);
              },
              itemBuilder: (context, index) {
                final message = messages[index];
                if (message.role == ChatRole.system) return const SizedBox();
                final isLast = index == messages.length - 1;
                final isFirst = messages.length == 2;
                final isAssistant = message.role == ChatRole.assistant;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MessageWrapper(
                      key: ValueKey(index),
                      scrollController: widget.scrollController,
                      message: message,
                      isTyping: (isLast && isAssistant && hasNewMessage) || isFirst,
                    ).animate().fadeIn(),
                    if (index == messages.length - 1 && !isLoading) ...[
                      const SizedBox(height: 16),
                      Wrap(
                        alignment: WrapAlignment.end,
                        children: suggestions.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: OutlinedButton(
                              onPressed: () {
                                context.chatBloc.add(SendMessage(content: e));
                                ChatScreenViewModelInherited.of(context).onScrollToBottom();
                              },
                              child: Text(e),
                            ),
                          );
                        }).toList(),
                      ).animate().fadeIn(),
                    ]
                  ],
                );
              },
              itemCount: messages.length,
            ),
          ),
        ),
      );
    }

    return const SizedBox();
  }
}

class ScrollControlInherited extends InheritedWidget {
  final bool isScrollControlledManually;

  const ScrollControlInherited({
    super.key,
    required this.isScrollControlledManually,
    required super.child,
  });

  static bool of(BuildContext context) {
    final inheritedWidget = context.dependOnInheritedWidgetOfExactType<ScrollControlInherited>();
    return inheritedWidget?.isScrollControlledManually ?? false;
  }

  @override
  bool updateShouldNotify(covariant ScrollControlInherited oldWidget) {
    return isScrollControlledManually != oldWidget.isScrollControlledManually;
  }
}
