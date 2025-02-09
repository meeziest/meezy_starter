import 'package:flutter/cupertino.dart';
import 'package:meezy_core/src/helpers/context_helpers/inherited_helper.dart';

class ShimmerSyncer extends InheritedWidget {
  final AnimationController shimmerSyncController;

  const ShimmerSyncer(this.shimmerSyncController, {required super.child});

  @override
  bool updateShouldNotify(covariant ShimmerSyncer oldWidget) {
    return shimmerSyncController != oldWidget.shimmerSyncController;
  }

  static AnimationController? of(
    BuildContext context, {
    bool listen = true,
  }) {
    final inheritedListen = context.inhMaybeOf<ShimmerSyncer>(listen: listen);
    return inheritedListen?.shimmerSyncController;
  }
}
