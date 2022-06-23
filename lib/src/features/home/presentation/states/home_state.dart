import 'package:imagineapp_test_gap/src/core/app_values/statuses.dart';
import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';

class HomeState {
  HomeState({
    required this.homeStatus,
    required this.popularMovies,
    this.indexPage = 1,
  });

  final HomeStatus homeStatus;
  final int indexPage;
  final List<MovieEntity> popularMovies;

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<MovieEntity>? popularMovies,
    int? indexPage,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      popularMovies: popularMovies ?? this.popularMovies,
      indexPage: indexPage ?? this.indexPage,
    );
  }
}
