import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/app_repository.dart';

class AppBloc extends Bloc {
  final AppRepository1 repo;
  final AppRepository2 repo1;
  final AppRepository3 repo2;

  AppBloc(this.repo, this.repo1, this.repo2) : super('');
}
