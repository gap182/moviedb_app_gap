import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/src/core/dependencies/dependencies.dart';
import 'package:imagineapp_test_gap/src/core/presentation/data/models/movie_model.dart';
import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';
import 'package:imagineapp_test_gap/src/core/utils/error_handler.dart';
import 'package:imagineapp_test_gap/src/core/utils/response_model.dart';

class PopularService {
  PopularService({
    required this.dio,
    required this.ref,
  });

  final Dio dio;
  final Ref ref;

  Future<ResponseModel<List<MovieEntity>, ErrorHandler>> getPopulars(
      int page) async {
    final config = ref.read(confgiProvider);

    try {
      final response = await dio.get(
        '/tv/popular',
        queryParameters: {
          'api_key': config.apiKey,
          'page': page,
          'language': 'en',
        },
      );
      final model = MoviesModel.fromMap(response.data);
      return ResponseModel(response: model.toEntity(), error: null);
    } on DioError catch (e) {
      return ResponseModel(
          response: null,
          error: ErrorHandler(
              keyId: 'dio', statusCode: e.response?.statusCode ?? -1));
    } catch (e) {
      return ResponseModel(
          response: null,
          error: ErrorHandler(keyId: 'unknown', statusCode: -1));
    }
  }
}
