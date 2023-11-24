part of 'player_bloc.dart';

@freezed
class PlayerEvent with _$PlayerEvent {
  const factory PlayerEvent.started() = _Started;
  const factory PlayerEvent.play(TrackEntity track) = _Play;
  const factory PlayerEvent.pause() = _Pause;
  const factory PlayerEvent.resume() = _Resume;
  const factory PlayerEvent.stop() = _Stop;
}
