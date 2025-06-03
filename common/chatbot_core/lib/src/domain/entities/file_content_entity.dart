import 'dart:typed_data';

import '../domain.dart';

class FileMessageEntity {
  final String? path;
  final Uint8List? bytes;
  final String? fileName;
  final ContentFileType fileType;
  final String? fileId;

  bool get isImage => fileType == ContentFileType.image;

  bool get isFile => fileType == ContentFileType.file;

  FileMessageEntity({required this.fileType, this.path, this.bytes, this.fileName, this.fileId});
}
