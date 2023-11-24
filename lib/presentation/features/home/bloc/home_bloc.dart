import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:old/domain/entities/search_response_entity.dart';
import 'package:old/domain/usecases/imp/search_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.searchUseCase}) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await mapEventToState(event).forEach(emit);
    });
  }

  final SearchUseCaseImpl searchUseCase;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield* event.map(
      started: (startedEvent) async* {
        log('Trying Shit');
        try {
          // Emit a loading state
          yield const HomeState.loading();

          // Perform a search using the searchUseCase
          final searchResult = await searchUseCase.search('Dream');

          // Emit a new state reflecting the successful search result
          yield HomeState.searchSuccess(searchResult);
        } catch (error) {
          // Handle the error and emit an error state
          yield HomeState.searchError(error.toString());
        }
      },
    );
  }
}
