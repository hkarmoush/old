import 'package:old/data/repositories/search_repository.dart';
import 'package:old/domain/entities/search_response_entity.dart';
import 'package:old/domain/usecases/abstract/abstract_search_usecase.dart';

class SearchUseCaseImpl implements SearchUseCase {
  SearchUseCaseImpl(this._repository);

  final SearchRepository _repository;

  @override
  Future<SearchResponseEntity> search(String query) {
    return _repository.search(query);
  }
}
