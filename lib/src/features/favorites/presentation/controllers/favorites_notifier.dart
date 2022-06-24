import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';
import 'package:imagineapp_test_gap/src/features/favorites/presentation/states/favorites_state.dart';

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  FavoritesNotifier() : super(FavoritesState());

  void updateFavorites(MovieEntity movie) {
    List<MovieEntity> tempListMovies = [];
    bool exist = false;

    tempListMovies.addAll(state.favoritesMovies);

    for (var element in state.favoritesMovies) {
      if (movie.id == element.id) {
        exist = true;
        tempListMovies.remove(element);
      }
    }

    if (!exist) {
      tempListMovies.add(movie);
    }

    state = state.copyWith(favoritesMovies: tempListMovies);
  }
}
