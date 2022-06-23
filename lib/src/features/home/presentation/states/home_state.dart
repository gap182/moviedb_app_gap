import 'package:imagineapp_test_gap/src/core/app_values/statuses.dart';
import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';

class HomeState {
  HomeState({
    required this.homeStatus,
    required this.popularMovies,
  });

  final HomeStatus homeStatus;
  final List<MovieEntity> popularMovies;

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<MovieEntity>? popularMovies,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      popularMovies: popularMovies ?? this.popularMovies,
    );
  }
}
