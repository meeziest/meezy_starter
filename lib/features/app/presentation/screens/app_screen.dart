import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meezy_starter/features/app/presentation/router/app_router.dart';

@RoutePage(name: 'AppRoute')
class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('Meezy App'),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.router.push(
                    LoginRoute(title: ''),
                  ),
                  child: Text('Login Screen'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.router.push(
                    RegisterRoute(title: ''),
                  ),
                  child: Text('Register Screen'),
                ),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ],
    );
  }
}
