import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/bloc_base/bloc/base_bloc.dart';

part 'profile_bloc.freezed.dart';

class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState.initial());
}

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = _Started;
}

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
}
