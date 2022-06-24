import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagineapp_test_gap/src/core/app_values/assets.dart';
import 'package:imagineapp_test_gap/src/core/dependencies/dependencies.dart';
import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';
import 'package:imagineapp_test_gap/src/core/theme/shape.dart';
import 'package:imagineapp_test_gap/src/core/theme/type.dart';
import 'package:imagineapp_test_gap/src/core/theme/ui_colors.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final urlImageDetail = movie.posterPath;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                children: [
                  Hero(
                    tag: 'movie${movie.id}',
                    child: SizedBox(
                      height: 500.h,
                      width: size.width,
                      child: Consumer(
                        builder: (context, ref, _) {
                          final imageUrl =
                              ref.watch(confgiProvider).imageBaseUrl;
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
                  const SizedBox(height: 20),
                  Text(
                    movie.name,
                    style: h1,
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
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      movie.overview,
                      style: normalText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
