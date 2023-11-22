import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationEvent {}

class NavigateToHomeEvent extends NavigationEvent {}

class NavigateToSettingsEvent extends NavigationEvent {}

class NavigationBloc extends Bloc<NavigationEvent, int> {
  NavigationBloc() : super(0);

  @override
  Stream<dynamic> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToHomeEvent) {
      yield 0; // You can use any value to represent the home page
    } else if (event is NavigateToSettingsEvent) {
      yield 1; // You can use any value to represent the settings page
    }
  }
}
