class MovieEntity {
  final String name;
  final int id;
  final String? posterPath;
  final double voteAverage;
  final String overview;
  MovieEntity({
    required this.name,
    required this.id,
    required this.posterPath,
    required this.voteAverage,
    required this.overview,
  });

  MovieEntity copyWith({
    String? name,
    int? id,
    String? posterPath,
    double? voteAverage,
    String? overview,
  }) {
    return MovieEntity(
      name: name ?? this.name,
      id: id ?? this.id,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      overview: overview ?? this.overview,
    );
  }
}
