enum ChatRole {
  user('user'),
  assistant('assistant'),
  system('system');

  final String value;

  const ChatRole(this.value);

  static ChatRole fromString(String role) {
    switch (role) {
      case 'user':
        return ChatRole.user;
      case 'assistant':
        return ChatRole.assistant;
      case 'system':
        return ChatRole.system;
      default:
        throw ArgumentError('Invalid role: $role');
    }
  }
}
