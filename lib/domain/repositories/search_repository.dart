// search_repository_impl.dart
import 'package:old/core/services/network_service.dart';
import 'package:old/data/dto/response/search_response_dto.dart';
import 'package:old/data/repositories/search_repository.dart';
import 'package:old/domain/entities/search_response_entity.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this._networkingService);

  final NetworkingService _networkingService;

  @override
  Future<SearchResponseEntity> search(String query) async {
    final response = await _networkingService.request<Map<String, dynamic>>(
      '/search?q=$query',
      method: HttpMethods.get,
      headers: {'Authorization': 'Bearer your_access_token'},
    );

    final dto = SearchResponseDTO.fromJson(response);

    final searchResponseEntity = SearchResponseEntity.fromDTO(dto);
    return searchResponseEntity;
  }
}
