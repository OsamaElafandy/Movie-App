import 'package:arch/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository _repository;

  GetTopRatedMoviesUseCase(this._repository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters NoParameters) async {
    return await _repository.getTopRatedMovies();
  }
}
