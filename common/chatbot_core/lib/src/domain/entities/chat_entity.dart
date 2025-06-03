import '../domain.dart';

class ChatEntity {
  final String chatId;
  final List<MessageEntity> messages;
  final String? chatName;
  final bool readyForAnalysis;

  ChatEntity({
    required this.chatId,
    this.messages = const [],
    this.chatName,
    this.readyForAnalysis = false,
  });

  ChatEntity.withSystemRole({
    required this.chatId,
    required String systemRole,
  })  : messages = [
          MessageEntity(
            role: ChatRole.system,
            content: ContentEntity(text: systemRole),
            createdAt: DateTime.now(),
          ),
        ],
        chatName = null,
        readyForAnalysis = false;

  ChatEntity copyWith({
    String? chatId,
    List<MessageEntity>? messages,
    String? chatName,
    bool? readyForAnalysis,
  }) {
    return ChatEntity(
      chatId: chatId ?? this.chatId,
      messages: messages ?? this.messages,
      chatName: chatName ?? this.chatName,
      readyForAnalysis: readyForAnalysis ?? this.readyForAnalysis,
    );
  }
}
