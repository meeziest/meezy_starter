import 'dart:async';

/// Mixin for easy handling cancellation of streams subscriptions.
mixin CancelableStreamSubscriptions {
  final List<StreamSubscription> _subscriptions = [];

  void cancelSubscriptions() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
  }

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }
}

extension CancelableBy on StreamSubscription {
  void cancelableBy(CancelableStreamSubscriptions stream) {
    stream.addSubscription(this);
  }
}
