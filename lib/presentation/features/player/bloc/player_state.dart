part of 'player_bloc.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState.initial() = _Initial;
  const factory PlayerState.loading() = _Loading;
  const factory PlayerState.playing() = _Playing;
  const factory PlayerState.paused() = _Paused;
  const factory PlayerState.stopped() = _Stopped;
  const factory PlayerState.error(String errorMessage) = _Error;
}
