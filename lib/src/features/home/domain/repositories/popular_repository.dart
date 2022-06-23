import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';
import 'package:imagineapp_test_gap/src/core/utils/error_handler.dart';
import 'package:imagineapp_test_gap/src/core/utils/response_model.dart';

abstract class PopularRepository {
  Future<ResponseModel<List<MovieEntity>, ErrorHandler>> getPopulars(int page);
}
