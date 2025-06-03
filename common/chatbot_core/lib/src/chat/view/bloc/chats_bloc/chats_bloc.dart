import 'package:meezy_core/meezy_core.dart';

import '../../../../domain/domain.dart';

part 'chats_bloc.freezed.dart';

class ChatsBloc extends MeezyBloc<ChatsEvent, ChatsState> {
  final ChatsRepository _chatsRepository;

  ChatsBloc({
    required ChatsRepository chatsRepository,
  })  : _chatsRepository = chatsRepository,
        super(const ChatsState.idle());

  @override
  EventTransformer<ChatsEvent> get eventTransformer => restartable();

  @override
  Future<void> onEventHandler(ChatsEvent event, Emitter<ChatsState> emit) {
    return event.map(
      saveChat: _saveChat,
      fetchChats: _fetchChats,
    );
  }

  Future<void> _fetchChats(FetchChats event) async {
    try {
      setState(ChatsState.loading(chats: state.chats));

      final chats = await _chatsRepository.fetchChats(userID: event.userID);

      setState(ChatsState.idle(chats: chats));
    } on Exception catch (error, stackTrace) {
      super.onError(error, stackTrace);
      setState(ChatsState.error(
        chats: state.chats,
        error: ExceptionData.error(
          message: 'Failed to fetch chats',
          detailed: error,
        ),
      ));
    } finally {
      setState(ChatsState.idle(
        chats: state.chats,
      ));
    }
  }

  Future<void> _saveChat(SaveChat event) async {
    try {
      setState(ChatsState.loading(
        chats: state.chats,
      ));

      final savedChat = await _chatsRepository.saveChat(chat: event.chat);

      final modifiableChats = Map.of(state.chats);

      /// Remove the previous chat lookup if chatId is changed
      if (savedChat.chatId != event.chat.chatId) {
        modifiableChats.remove(event.chat.chatId);
      }

      modifiableChats[savedChat.chatId] = savedChat;

      setState(ChatsState.idle(chats: modifiableChats));
    } on Exception catch (error, stackTrace) {
      super.onError(error, stackTrace);
      setState(ChatsState.error(
        chats: state.chats,
        error: ExceptionData.error(
          message: 'Failed to save chat',
          detailed: error,
        ),
      ));
    } finally {
      setState(ChatsState.idle(
        chats: state.chats,
      ));
    }
  }
}

@freezed
class ChatsEvent with _$ChatsEvent {
  const factory ChatsEvent.fetchChats({
    required String userID,
  }) = FetchChats;

  const factory ChatsEvent.saveChat({
    required ChatEntity chat,
  }) = SaveChat;
}

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState.idle({
    @Default({}) Map<String, ChatEntity> chats,
  }) = ChatsIdle;

  const factory ChatsState.loading({
    @Default({}) Map<String, ChatEntity> chats,
  }) = ChatsLoading;

  const factory ChatsState.error({
    @Default({}) Map<String, ChatEntity> chats,
    required ExceptionData error,
  }) = ChatsError;
}
