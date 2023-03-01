import 'package:arch/movies/data/repository/movies_repository.dart';
import 'package:arch/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository _repository;

  GetPopularMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters NoParameters) async {
    return await _repository.getPopularMovies();
  }
}
