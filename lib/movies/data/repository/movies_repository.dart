import 'package:arch/core/error/exceptions.dart';
import 'package:arch/core/error/failure.dart';
import 'package:arch/movies/data/datasourse/movie_remote_datasource.dart';
import 'package:arch/movies/domain/entities/movie.dart';
import 'package:arch/movies/domain/entities/movie_detail.dart';
import 'package:arch/movies/domain/entities/recommends.dart';
import 'package:arch/movies/domain/repository/base_movie_repository.dart';
import 'package:arch/movies/domain/usecase/get_recommends.dart';
import 'package:dartz/dartz.dart';

import '../../domain/usecase/get_movie_detail.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource movieRemoteDataSource;
  MoviesRepository(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await movieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await movieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await movieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(
      MovieDetailUseCaseParams params) async {
    final result = await movieRemoteDataSource.getMovieDetail(params);

    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommends>>> getRecommends(
      RecommendsUseCaseParam params) async {
    final result = await movieRemoteDataSource.getRecommends(params);

    try {
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}
