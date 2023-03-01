import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';
import '../entities/recommends.dart';
import '../usecase/get_movie_detail.dart';
import '../usecase/get_recommends.dart';

// contract
abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetail(
      MovieDetailUseCaseParams params);

  Future<Either<Failure, List<Recommends>>> getRecommends(
      RecommendsUseCaseParam params);
}
