import 'package:old/data/repositories/search_repository.dart';
import 'package:old/domain/entities/search_response_entity.dart';

abstract class SearchUseCase {
  SearchUseCase(SearchRepository searchRepository);

  Future<SearchResponseEntity> search(String query);
}
