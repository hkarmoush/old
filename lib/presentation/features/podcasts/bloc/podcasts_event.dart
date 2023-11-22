part of 'podcasts_bloc.dart';

@freezed
class PodcastsEvent with _$PodcastsEvent {
  const factory PodcastsEvent.started() = _Started;
}
