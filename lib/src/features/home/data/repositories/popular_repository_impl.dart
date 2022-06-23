import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';
import 'package:imagineapp_test_gap/src/core/utils/error_handler.dart';
import 'package:imagineapp_test_gap/src/core/utils/response_model.dart';
import 'package:imagineapp_test_gap/src/features/home/data/services/popular_service.dart';
import 'package:imagineapp_test_gap/src/features/home/domain/repositories/popular_repository.dart';

class PopularRepositoryImpl implements PopularRepository {
  final PopularService service;
  PopularRepositoryImpl({
    required this.service,
  });

  @override
  Future<ResponseModel<List<MovieEntity>, ErrorHandler>> getPopulars(
      int page) async {
    final response = await service.getPopulars(page);
    return response;
  }
}
