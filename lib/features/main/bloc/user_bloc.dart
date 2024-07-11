import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/bloc_base/bloc/base_bloc.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends BaseBloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.initial());
}

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.started() = _Started;
}

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
}
