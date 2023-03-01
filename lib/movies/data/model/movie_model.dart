import 'package:arch/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.releaseDate,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      releaseDate: json['release_date'] as String,
      backdropPath: json['backdrop_path'] as String,
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'] as String,
      voteAverage: json['vote_average'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'overview': overview,
      'vote_average': voteAverage,
    };
  }
}
