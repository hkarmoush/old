import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:old/core/services/audio_service.dart';
import 'package:old/domain/entities/track_entity.dart';

part 'player_event.dart';
part 'player_state.dart';
part 'player_bloc.freezed.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(const PlayerState.initial()) {
    on<PlayerEvent>(emitEvent);
    audioPlayerService.onPlayerStateChanged.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        _playingTrackController.add(null);
        emit(const PlayerState.stopped());
      }
    });
  }

  final AudioPlayerService audioPlayerService = AudioPlayerService();
  final _playingTrackController = StreamController<TrackEntity?>.broadcast();

  TrackEntity? playingTrack;
  Stream<TrackEntity?> get playingTrackStream => _playingTrackController.stream;

  Future<void> emitEvent(PlayerEvent event, Emitter<PlayerState> emit) async {
    await for (final state in mapEventToState(event)) {
      emit(state);
    }
  }

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    yield* event.map(
      started: (startedEvent) async* {
        // You can add initialization logic here
      },
      play: (playEvent) async* {
        if (playingTrack != playEvent.track) {
          await audioPlayerService.stop();
        }

        yield const PlayerState.loading();

        try {
          playingTrack = playEvent.track;
          _playingTrackController.add(playEvent.track);
          await audioPlayerService.play(playEvent.track.preview);

          yield const PlayerState.playing();
        } catch (error) {
          yield PlayerState.error(error.toString());
        }
      },
      pause: (pauseEvent) async* {
        await audioPlayerService.pause();
        yield const PlayerState.paused();
      },
      resume: (resumeEvent) async* {
        await audioPlayerService.resume();
        yield const PlayerState.playing();
      },
      stop: (stopEvent) async* {
        await audioPlayerService.stop();
        playingTrack = null;
        _playingTrackController.add(null);
        yield const PlayerState.stopped();
      },
    );
  }
}
