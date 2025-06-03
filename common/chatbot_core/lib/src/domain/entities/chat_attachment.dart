import 'dart:typed_data';

import '../domain.dart';

class ChatAttachment {
  final String? fileId;
  final String path;
  final String? fileName;
  final Uint8List? bytes;
  final ContentFileType type;
  final bool isLoading;

  bool get isImage => type == ContentFileType.image;

  bool get isFile => type == ContentFileType.file;

  ChatAttachment({
    required this.type,
    required this.path,
    this.fileName,
    this.fileId,
    this.bytes,
    this.isLoading = true,
  });

  ChatAttachment copyWith({
    ContentFileType? type,
    String? fileId,
    String? path,
    String? fileName,
    Uint8List? bytes,
    bool? isLoading,
  }) {
    return ChatAttachment(
      type: type ?? this.type,
      fileId: fileId ?? this.fileId,
      path: path ?? this.path,
      fileName: fileName ?? this.fileName,
      bytes: bytes ?? this.bytes,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
