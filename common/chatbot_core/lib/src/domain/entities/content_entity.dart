import '../domain.dart';

class ContentEntity {
  final String text;
  final List<ChatAttachment> files;

  ContentEntity({required this.text, this.files = const []});
}
