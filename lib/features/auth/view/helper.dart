import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

extension AuthBlocContextExt on BuildContext {
  AuthBloc get authBloc => read<AuthBloc>();
}
