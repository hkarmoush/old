import 'package:get_it/get_it.dart';
import 'package:old/core/services/network_service.dart';
import 'package:old/domain/repositories/search_repository.dart';
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
    ..registerLazySingleton<SearchUseCaseImpl>(
      () => SearchUseCaseImpl(di<SearchRepositoryImpl>()),
    );
}

NetworkService injectNetworkService() {
  const apiKey = '622eef1b89mshf253145d9365bc4p1896aajsn56b1f83338cc';
  return NetworkService(
    baseUrl: 'https://api.deezer.com',
    key: apiKey,
    defaultHeaders: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'deezerdevs-deezer.p.rapidapi.com',
    },
  );
}
