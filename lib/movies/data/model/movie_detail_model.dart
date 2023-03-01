import 'package:arch/movies/data/model/genres_model.dart';

import '../../domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel(
      {required super.id,
      required super.title,
      required super.overview,
      required super.backdropPath,
      required super.releaseDate,
      required super.runtime,
      required super.voteAverage,
      required super.genres});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String,
      releaseDate: json['release_date'] as String,
      runtime: json['runtime'] as int,
      voteAverage: json['vote_average'].toDouble(),
      genres: List<GenresModel>.from(
          json['genres'].map((e) => GenresModel.fromJson(e))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'backdrop_path': backdropPath,
      'release_date': releaseDate,
      'runtime': runtime,
      'vote_average': voteAverage,
      'genres': genres,
    };
  }
}
