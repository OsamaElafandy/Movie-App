import 'package:arch/movies/domain/entities/movie_detail.dart';
import 'package:arch/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';

class GetMovieDetailUseCase
    extends BaseUseCase<MovieDetail, MovieDetailUseCaseParams> {
  final BaseMovieRepository _repository;

  GetMovieDetailUseCase(this._repository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailUseCaseParams params) async {
    return await _repository.getMovieDetail(params);
  }
}

class MovieDetailUseCaseParams extends Equatable {
  final int movieId;

  const MovieDetailUseCaseParams(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
