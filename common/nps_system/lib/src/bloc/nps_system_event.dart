part of 'nps_system_bloc.dart';

@immutable
sealed class NpsSystemEvent {}

final class GetNPS extends NpsSystemEvent {
  GetNPS();
}

final class SendNPSResult extends NpsSystemEvent {
  final NPSResult request;
  final int maxRating;

  SendNPSResult(this.request, this.maxRating);
}
