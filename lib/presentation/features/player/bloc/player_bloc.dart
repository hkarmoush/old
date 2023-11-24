import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:old/core/services/audio_service.dart';

part 'player_event.dart';
part 'player_state.dart';
part 'player_bloc.freezed.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(const PlayerState.initial()) {
    on<PlayerEvent>(emitEvent);
  }
  final AudioPlayerService _audioPlayerService = AudioPlayerService();

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
        yield const PlayerState.loading();

        try {
          await _audioPlayerService.play(playEvent.url);
          yield const PlayerState.playing();
        } catch (error) {
          yield PlayerState.error(error.toString());
        }
      },
      pause: (pauseEvent) async* {
        await _audioPlayerService.pause();
        yield const PlayerState.paused();
      },
      resume: (resumeEvent) async* {
        await _audioPlayerService.resume();
        yield const PlayerState.playing();
      },
      stop: (stopEvent) async* {
        await _audioPlayerService.stop();
        yield const PlayerState.stopped();
      },
    );
  }
}
