import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../di/dependency.dart';

const DEPENDENCIES_TAG = 'DEPENDENCIES';

abstract class BaseScopedRouter {
  Widget get scopedFeature;
}

extension ScopeDependencyContext on BuildContext {
  Dependencies get dependencies => RouteData.of(this).meta[DEPENDENCIES_TAG];
  Dependencies get scopeDi => RouteData.of(this).meta[DEPENDENCIES_TAG];
}
