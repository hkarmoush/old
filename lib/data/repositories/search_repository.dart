import 'package:old/core/services/network_service.dart';
import 'package:old/domain/entities/search_response_entity.dart';

abstract class SearchRepository {
  SearchRepository(NetworkingService networkingService);

  Future<SearchResponseEntity> search(String query);
}
