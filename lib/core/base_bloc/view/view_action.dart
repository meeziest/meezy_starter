import 'package:auto_route/auto_route.dart';

sealed class ViewAction {}

class NavigationAction extends ViewAction {
  final String pathToRoute;
  final bool includePrefixMatches;
  final OnNavigationFailure? onFailure;

  NavigationAction({
    required this.pathToRoute,
    this.includePrefixMatches = false,
    this.onFailure,
  });
}

class NotificationAction extends ViewAction {
  final String notificationMessage;

  NotificationAction({required this.notificationMessage});
}

class DisplayFailureAction extends ViewAction {
  final String errorMessage;

  DisplayFailureAction({required this.errorMessage});
}
