import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/domain/repositories/app_repository.dart';
import '../../domain/repositories/auth_repository.dart';

@RoutePage(name: 'RegisterRoute')
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final appRepo = context.read<AppRepository1>();
    final authRepo = context.read<AuthRepository1>();
    print(appRepo);
    print(authRepo);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.popRoute(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Register page'),
            Text(appRepo.toString()),
            Text(authRepo.toString()),
          ],
        ),
      ),
    );
  }
}
