import 'package:chatbot_core/chatbot_core.dart';
import 'package:flutter/material.dart';
import 'package:meezy_core/meezy_core.dart';

import '../../domain/domain.dart';

/// ViewModel holding both UI state and the loaded ChatEntity.
class ChatScreenViewModel {
  final ChatEntity chatEntity;
  final bool isAtBottom;
  final bool isSubscribed;
  final FocusNode focusNode;
  final ScrollController scrollController;
  final VoidCallback onScrollToBottom;
  final bool isTyping;
  final bool isReadyForAnalysis;

  ChatScreenViewModel({
    required this.chatEntity,
    required this.isAtBottom,
    required this.isSubscribed,
    required this.focusNode,
    required this.scrollController,
    required this.onScrollToBottom,
    this.isTyping = false,
    this.isReadyForAnalysis = false,
  });
}

/// Inherited widget to provide [ChatScreenViewModel] to descendants.
class ChatScreenViewModelInherited extends InheritedWidget {
  final ChatScreenViewModel viewModel;

  const ChatScreenViewModelInherited({
    super.key,
    required this.viewModel,
    required super.child,
  });

  static ChatScreenViewModel of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ChatScreenViewModelInherited>();
    assert(provider != null, 'No ChatScreenViewModelProvider found in context');
    return provider!.viewModel;
  }

  @override
  bool updateShouldNotify(ChatScreenViewModelInherited oldWidget) {
    // Notify dependents when the viewModel instance changes.
    return oldWidget.viewModel != viewModel;
  }
}

/// ChatScreen acts as a logic wrapper. It listens to the ChatBloc,
/// manages UI state (scroll, focus, chatId), and then provides the composed
/// ChatScreenViewModel via an inherited widget.
class ChatScreenLogicWrapper extends StatefulWidget {
  final ChatEntity chat;
  final Widget Function(BuildContext, ChatScreenViewModel) builder;

  const ChatScreenLogicWrapper({
    super.key,
    required this.chat,
    required this.builder,
  });

  @override
  State<ChatScreenLogicWrapper> createState() => _ChatScreenLogicWrapperState();
}

class _ChatScreenLogicWrapperState extends State<ChatScreenLogicWrapper> with AutoRouteAwareStateMixin {
  bool _isAtBottom = true;
  bool isSubscribed = false;
  bool isTyping = false;
  bool isReadyForAnalysis = false;
  String? chatName;
  final FocusNode _focusNode = FocusNode();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    chatName = widget.chat.chatName;
    isReadyForAnalysis = widget.chat.readyForAnalysis;
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void didUpdateWidget(covariant ChatScreenLogicWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.chat.chatName != chatName || widget.chat.readyForAnalysis) {
      chatName = widget.chat.chatName;
      if (widget.chat.readyForAnalysis) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => isReadyForAnalysis = true,
        );
      }
      context.chatsBloc.add(
        SaveChat(
          chat: widget.chat.copyWith(
            chatName: chatName,
            readyForAnalysis: widget.chat.readyForAnalysis,
          ),
        ),
      );
    }
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final maxScrollExtent = _scrollController.position.maxScrollExtent - 32;
      if (_scrollController.position.pixels <= maxScrollExtent) {
        setState(() => _isAtBottom = false);
      } else {
        setState(() => _isAtBottom = true);
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      while (_scrollController.position.maxScrollExtent != _scrollController.position.pixels) {
        await _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ChatScreenViewModel(
      chatEntity: widget.chat,
      isAtBottom: _isAtBottom,
      isSubscribed: isSubscribed,
      focusNode: _focusNode,
      scrollController: _scrollController,
      onScrollToBottom: _scrollToBottom,
      isTyping: isTyping,
      isReadyForAnalysis: isReadyForAnalysis && !isTyping,
    );

    return NotificationListener<TypingNotification>(
      onNotification: (TypingNotification notification) {
        setState(() => isTyping = notification.isTyping);
        return false;
      },
      child: ChatScreenViewModelInherited(
        viewModel: viewModel,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: widget.builder(context, viewModel),
          ),
        ),
      ),
    );
  }
}
