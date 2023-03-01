import 'package:arch/movies/domain/entities/genres.dart';
import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final List<Genres> genres;

  const MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        backdropPath,
        releaseDate,
        runtime,
        voteAverage,
        genres,
      ];
}
