import 'package:arch/core/error/failure.dart';
import 'package:arch/core/usecase/base_use_case.dart';
import 'package:arch/movies/domain/entities/recommends.dart';
import 'package:arch/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendsUseCase
    extends BaseUseCase<List<Recommends>, RecommendsUseCaseParam> {
  final BaseMovieRepository _repository;

  GetRecommendsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Recommends>>> call(
      RecommendsUseCaseParam parameters) async {
    return await _repository.getRecommends(parameters);
  }
}

class RecommendsUseCaseParam extends Equatable {
  final int movieId;

  const RecommendsUseCaseParam(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
