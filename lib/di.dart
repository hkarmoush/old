import 'package:get_it/get_it.dart';
import 'package:old/core/services/network_service.dart';
import 'package:old/domain/repositories/search_repository.dart';
import 'package:old/domain/usecases/abstract/abstract_search_usecase.dart';
import 'package:old/domain/usecases/imp/search_usecase.dart';

final di = GetIt.instance;

void initDI() {
  di
    ..registerLazySingleton<NetworkingService>(
      injectNetworkService,
    )
    ..registerLazySingleton<SearchRepositoryImpl>(
      () => SearchRepositoryImpl(di<NetworkingService>()),
    )
    ..registerLazySingleton<SearchUseCase>(
      () => SearchUseCaseImpl(di<SearchRepositoryImpl>()),
    );
}

NetworkService injectNetworkService() {
  return NetworkService(
    baseUrl: 'https://deezerdevs-deezer.p.rapidapi.com',
    key: 'https://deezerdevs-deezer.p.rapidapi.com',
    defaultHeaders: {
      'X-RapidAPI-Key': 'https://deezerdevs-deezer.p.rapidapi.com',
      'X-RapidAPI-Host': 'deezerdevs-deezer.p.rapidapi.com',
    },
  );
}
