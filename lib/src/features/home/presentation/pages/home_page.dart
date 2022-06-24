import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/src/core/app_values/statuses.dart';
import 'package:imagineapp_test_gap/src/core/dependencies/dependencies.dart';
import 'package:imagineapp_test_gap/src/core/presentation/widgets/custom_loading.dart';
import 'package:imagineapp_test_gap/src/core/presentation/widgets/movie_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeProvider.notifier).getPopulars();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeStatus =
        ref.watch(homeProvider.select((value) => value.homeStatus));

    final movies =
        ref.watch(homeProvider.select((value) => value.popularMovies));

    return Stack(
      children: [
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index == movies.length) {
              return IconButton(
                  onPressed: () {
                    ref.read(homeProvider.notifier).updatePopulars();
                  },
                  icon: const Icon(Icons.arrow_downward));
            } else {
              final favoritesList =
                  ref.watch(favoritesProvider).favoritesMovies;
              bool isFavorite = false;
              for (var element in favoritesList) {
                if (element.id == movies[index].id) {
                  isFavorite = true;
                }
              }
              return MovieCard(
                movie: movies[index],
                isFavorite: isFavorite,
              );
            }
          },
        ),
        if (homeStatus == HomeStatus.loading) const CustomLoading()
      ],
    );
  }
}
