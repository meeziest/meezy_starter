import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meezy_starter/core/helpers/context_helpers/inherited_helper.dart';

import 'dependency.dart';

class FeatureScope extends InheritedWidget {
  const FeatureScope({
    required super.child,
    required this.dependencies,
    super.key,
  });

  final Dependencies dependencies;

  static Dependencies of(BuildContext context) =>
      context.inhOf<FeatureScope>(listen: false).dependencies;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Dependencies>('dependencies', dependencies),
    );
  }

  @override
  bool updateShouldNotify(FeatureScope oldWidget) => false;
}
