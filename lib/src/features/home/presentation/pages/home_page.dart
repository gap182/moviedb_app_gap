import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/generated/l10n.dart';
import 'package:imagineapp_test_gap/src/core/app_values/assets.dart';
import 'package:imagineapp_test_gap/src/core/app_values/statuses.dart';
import 'package:imagineapp_test_gap/src/core/dependencies/dependencies.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeProvider.notifier).getPopulars(1);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeStatus =
        ref.watch(homeProvider.select((value) => value.homeStatus));

    final movies =
        ref.watch(homeProvider.select((value) => value.popularMovies));

    final imageUrl = ref.read(confgiProvider).imageBaseUrl;

    switch (homeStatus) {
      case HomeStatus.initial:
        return const Center(child: CircularProgressIndicator());
      case HomeStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case HomeStatus.error:
        return Center(child: Image.asset(Assets.errorGeneral));
      case HomeStatus.done:
        return ListView.builder(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index == movies.length) {
              return IconButton(
                  onPressed: () {
                    ref.read(homeProvider.notifier).updatePopulars(2);
                  },
                  icon: Icon(Icons.arrow_downward));
            } else {
              final urlImageDetail = movies[index].posterPath;
              return Container(
                height: 80,
                width: 40,
                child: urlImageDetail != null
                    ? CachedNetworkImage(imageUrl: '$imageUrl$urlImageDetail')
                    : Image.asset(Assets.noImage),
              );
            }
          },
        );

      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
