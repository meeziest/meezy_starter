import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthBloc extends Bloc {
  final AuthRepository1 repo;
  final AuthRepository2 repo1;
  final AuthRepository3 repo2;

  AuthBloc(this.repo, this.repo1, this.repo2) : super('');
}
