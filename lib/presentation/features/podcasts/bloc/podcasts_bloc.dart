import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'podcasts_event.dart';
part 'podcasts_state.dart';
part 'podcasts_bloc.freezed.dart';

class PodcastsBloc extends Bloc<PodcastsEvent, PodcastsState> {
  PodcastsBloc() : super(const PodcastsState.initial()) {
    on<PodcastsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
