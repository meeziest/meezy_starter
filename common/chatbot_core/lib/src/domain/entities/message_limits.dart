class MessageLimits {
  final int messageRemaining;
  final DateTime? renewTime;

  MessageLimits({required this.messageRemaining, this.renewTime});

  MessageLimits copyWith({
    int? messageRemaining,
    DateTime? renewTime,
  }) {
    return MessageLimits(
      messageRemaining: messageRemaining ?? this.messageRemaining,
      renewTime: renewTime ?? this.renewTime,
    );
  }
}
