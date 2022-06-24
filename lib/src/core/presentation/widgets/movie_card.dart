import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:imagineapp_test_gap/src/core/app_values/assets.dart';
import 'package:imagineapp_test_gap/src/core/dependencies/dependencies.dart';
import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';
import 'package:imagineapp_test_gap/src/core/theme/shape.dart';
import 'package:imagineapp_test_gap/src/core/theme/type.dart';
import 'package:imagineapp_test_gap/src/core/theme/ui_colors.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movie,
    required this.isFavorite,
  }) : super(key: key);

  final MovieEntity movie;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final urlImageDetail = movie.posterPath;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.go('/main/detail', extra: movie);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 150.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: 'movie${movie.id}',
                  child: SizedBox(
                    width: 90.w,
                    child: Consumer(
                      builder: (context, ref, _) {
                        final imageUrl = ref.watch(confgiProvider).imageBaseUrl;
                        return urlImageDetail != null
                            ? CachedNetworkImage(
                                imageUrl: '$imageUrl$urlImageDetail',
                                errorWidget: (context, _, __) =>
                                    Image.asset(Assets.noImage),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadiusMedium,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : Image.asset(Assets.noImage);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        movie.name,
                        style: h3,
                      ),
                      const SizedBox(height: 20),
                      RatingBar.builder(
                        allowHalfRating: true,
                        initialRating: movie.voteAverage,
                        itemSize: 20.w,
                        maxRating: 10.0,
                        itemCount: 10,
                        itemBuilder: (context, _) {
                          return const Icon(
                            Icons.star,
                            color: UIColors.greenBase,
                          );
                        },
                        onRatingUpdate: (v) {},
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${movie.voteAverage}',
                        style: normalText,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            right: 20.w,
            top: 20.h,
            child: Consumer(
              builder: (context, ref, child) {
                return GestureDetector(
                  onTap: () {
                    ref.read(favoritesProvider.notifier).updateFavorites(movie);
                  },
                  child: Icon(
                    Icons.favorite,
                    color: isFavorite ? UIColors.greenBase : Colors.grey,
                  ),
                );
              },
            )),
      ],
    );
  }
}
