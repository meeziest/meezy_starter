import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/session_bloc.dart';

extension AuthBlocContextExt on BuildContext {
  SessionBloc get authBloc => read<SessionBloc>();
}
