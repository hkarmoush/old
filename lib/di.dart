import 'package:get_it/get_it.dart';
import 'package:old/core/services/network_service.dart';

final di = GetIt.instance;

void initDI() {
  di.registerLazySingleton<NetworkingService>(
    injectNetworkService,
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
