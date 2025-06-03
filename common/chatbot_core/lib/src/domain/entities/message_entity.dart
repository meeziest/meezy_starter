import '../domain.dart';

class MessageEntity {
  final ContentEntity content;
  final ChatRole role;
  final DateTime createdAt;
  final bool generating;
  final List<String> nextSuggestions;

  MessageEntity({
    required this.content,
    required this.createdAt,
    required this.role,
    this.generating = false,
    this.nextSuggestions = const [],
  });

  List<ChatAttachment> get images => content.files.where((element) => element.isImage).toList();

  List<ChatAttachment> get files => content.files.where((element) => element.isFile).toList();

  MessageEntity copyWith({
    String? id,
    ContentEntity? content,
    ChatRole? role,
    DateTime? createdAt,
    bool? isLoading,
    List<String>? nextSuggestions,
    bool? readyForAnalysis,
  }) {
    return MessageEntity(
      content: content ?? this.content,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      generating: isLoading ?? this.generating,
      nextSuggestions: nextSuggestions ?? this.nextSuggestions,
    );
  }
}
