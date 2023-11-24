part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.searchSuccess(SearchResponseEntity searchResult) =
      _SearchSuccess;
  const factory HomeState.searchError(String errorMessage) = _SearchError;
}
