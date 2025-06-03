import 'package:meezy_core/meezy_core.dart';

import '../../../../domain/domain.dart';

part 'chat_bloc.freezed.dart';

class ChatBloc extends MeezyBloc<ChatEvent, ChatState> {
  final ChatMessageRepository _messageRepository;

  ChatBloc({
    required ChatEntity chat,
    required ChatMessageRepository messageRepository,
  })  : _messageRepository = messageRepository,
        super(ChatState.idle(chat: chat));

  @override
  Future<void> onEventHandler(ChatEvent event, Emitter<ChatState> emit) {
    return event.map(
      sendMessage: _sendMessage,
    );
  }

  /// Sends a message to the chat and generates a response.
  Future<void> _sendMessage(SendMessage event) async {
    try {
      var updatedMessages = List<MessageEntity>.of([
        ...state.chat.messages,
        MessageEntity(
          role: ChatRole.user,
          content: ContentEntity(text: event.content),
          createdAt: DateTime.now(),
        ),
        MessageEntity(
          role: ChatRole.assistant,
          content: ContentEntity(text: ''),
          createdAt: DateTime.now(),
          generating: true,
        ),
      ]);

      setState(ChatState.idle(
        chat: state.chat.copyWith(
          messages: updatedMessages,
        ),
      ));

      /// Appends the new message to the chat
      final response = await _messageRepository.generateResponse(
        chatMessages: updatedMessages,
      );

      /// If the chat is already ready for analysis, keep it as is
      final isReadyForAnalysis = !state.chat.readyForAnalysis //
          ? response.readyForAnalysis
          : state.chat.readyForAnalysis;

      final updatedChat = state.chat.copyWith(
        messages: response.messages,
        chatName: response.chatName ?? state.chat.chatName,
        readyForAnalysis: isReadyForAnalysis,
      );

      setState(state.copyWith(chat: updatedChat));
    } on Exception catch (error, stackTrace) {
      super.onError(error, stackTrace);
      setState(ChatState.error(
        chat: state.chat,
        error: ExceptionData.warning(
          message: 'Failed to send message',
          detailed: error,
        ),
      ));
    } finally {
      setState(ChatState.idle(
        chat: state.chat,
      ));
    }
  }
}

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage({
    required String content,
    @Default([]) List<ChatAttachment> attachments,
  }) = SendMessage;
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState.idle({
    required ChatEntity chat,
  }) = ChatIdle;

  const factory ChatState.loading({
    required ChatEntity chat,
  }) = ChatLoading;

  const factory ChatState.error({
    required ChatEntity chat,
    required ExceptionData error,
  }) = ChatError;
}
