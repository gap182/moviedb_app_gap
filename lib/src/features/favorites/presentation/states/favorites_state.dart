import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';

class FavoritesState {
  final List<MovieEntity> favoritesMovies;
  FavoritesState({
    this.favoritesMovies = const [],
  });

  FavoritesState copyWith({
    List<MovieEntity>? favoritesMovies,
  }) {
    return FavoritesState(
      favoritesMovies: favoritesMovies ?? this.favoritesMovies,
    );
  }
}
