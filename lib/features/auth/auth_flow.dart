import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@RoutePage(name: 'AuthFlowRoute')
class AuthFlow extends StatelessWidget {
  const AuthFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      builder: (context, child) => child,
    );
  }
}
