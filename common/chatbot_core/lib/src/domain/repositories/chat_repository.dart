import '../domain.dart';

/// Handles creating a new chat and retrieving existing chats.
abstract class ChatsRepository {
  Future<Map<String, ChatEntity>> fetchChats({required String userID});
  Future<ChatEntity> saveChat({required ChatEntity chat});
}

/// Handles sending messages, generating responses, file uploads, and renaming chats.
abstract class ChatMessageRepository {
  Future<ChatResponse> generateResponse({required List<MessageEntity> chatMessages});
}

abstract class ChatDeepAnalysisRepository {
  Future<String> generateDeepAnalysis(String? chatId, {required String prompt});
}

typedef ChatResponse = ({
  List<MessageEntity> messages,
  bool readyForAnalysis,
  String? chatName,
});

final class MockChatsRepository implements ChatsRepository {
  @override
  Future<Map<String, ChatEntity>> fetchChats({required String userID}) async {
    /// Mock data for testing purposes
    return {};
  }

  @override
  Future<ChatEntity> saveChat({required ChatEntity chat}) async {
    /// Mock data for testing purposes
    return chat;
  }
}
