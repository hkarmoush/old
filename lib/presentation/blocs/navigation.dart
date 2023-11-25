import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationEvent {}

class NavigateToHomeEvent extends NavigationEvent {}

class NavigateToSearchEvent extends NavigationEvent {}

class NavigateToPlayerEvent extends NavigationEvent {}

class NavigateToPodcastsEvent extends NavigationEvent {}

class NavigateToSettingsEvent extends NavigationEvent {}

class NavigationBloc extends Bloc<NavigationEvent, int> {
  NavigationBloc() : super(0) {
    on<NavigateToHomeEvent>((event, emit) {
      emit(0);
    });
    on<NavigateToSearchEvent>((event, emit) {
      emit(1);
    });
    on<NavigateToPodcastsEvent>((event, emit) {
      emit(2);
    });
    on<NavigateToSettingsEvent>((event, emit) {
      emit(3);
    });
  }
}
