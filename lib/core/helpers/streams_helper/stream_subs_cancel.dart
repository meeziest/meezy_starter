import 'dart:async';

/// Mixin for easy handling cancellation of streams subscriptions.
mixin CancelableStreamSubscriptions {
  final List<StreamSubscription<dynamic>> _subscriptions = [];

  void cancelSubscriptions() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
  }

  void addSubscription(StreamSubscription<dynamic> subscription) {
    _subscriptions.add(subscription);
  }
}

extension CancelableBy on StreamSubscription<dynamic> {
  void cancelableBy(CancelableStreamSubscriptions stream) {
    stream.addSubscription(this);
  }
}
