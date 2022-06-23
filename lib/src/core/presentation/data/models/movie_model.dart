import 'dart:convert';

import 'package:imagineapp_test_gap/src/core/presentation/domain/entities/movie_entity.dart';

MoviesModel moviesModelFromMap(String str) =>
    MoviesModel.fromMap(json.decode(str));

String moviesModelToMap(MoviesModel data) => json.encode(data.toMap());

class MoviesModel {
  MoviesModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  MoviesModel copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MoviesModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  List<MovieEntity> toEntity() {
    if (results == null) return [];
    final tempList = <MovieEntity>[];
    for (var element in results!) {
      tempList.add(
        MovieEntity(
          name: element.name ?? '',
          posterPath: element.posterPath,
          voteAverage: element.voteAverage ?? 0.0,
          overview: element.overview ?? '',
          id: element.id ?? -1,
        ),
      );
    }
    return tempList;
  }

  factory MoviesModel.fromMap(Map<String, dynamic> json) => MoviesModel(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": results != null
            ? List<dynamic>.from(results!.map((x) => x.toMap()))
            : [],
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  final String? backdropPath;
  final DateTime? firstAirDate;
  final List<int>? genreIds;
  final int? id;
  final String? name;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;

  Result copyWith({
    String? backdropPath,
    DateTime? firstAirDate,
    List<int>? genreIds,
    int? id,
    String? name,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    double? voteAverage,
    int? voteCount,
  }) =>
      Result(
        backdropPath: backdropPath ?? this.backdropPath,
        firstAirDate: firstAirDate ?? this.firstAirDate,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        name: name ?? this.name,
        originCountry: originCountry ?? this.originCountry,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalName: originalName ?? this.originalName,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toMap() => {
        "backdrop_path": backdropPath,
        "first_air_date":
            "${firstAirDate?.year.toString().padLeft(4, '0')}-${firstAirDate?.month.toString().padLeft(2, '0')}-${firstAirDate?.day.toString().padLeft(2, '0')}",
        "genre_ids":
            genreIds != null ? List<dynamic>.from(genreIds!.map((x) => x)) : [],
        "id": id,
        "name": name,
        "origin_country": originCountry != null
            ? List<dynamic>.from(originCountry!.map((x) => x))
            : [],
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
