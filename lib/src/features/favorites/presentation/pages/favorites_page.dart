import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/src/core/dependencies/dependencies.dart';
import 'package:imagineapp_test_gap/src/core/presentation/widgets/movie_card.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesMovies = ref.watch(favoritesProvider).favoritesMovies;
    return Center(
      child: ListView.builder(
        itemCount: favoritesMovies.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: favoritesMovies[index],
            isFavorite: true,
          );
        },
      ),
    );
  }
}
