enum ContentFileType {
  image,
  file;

  static ContentFileType fromString(String type) {
    switch (type) {
      case 'image':
        return ContentFileType.image;
      case 'file':
        return ContentFileType.file;
      default:
        return ContentFileType.file;
    }
  }
}
