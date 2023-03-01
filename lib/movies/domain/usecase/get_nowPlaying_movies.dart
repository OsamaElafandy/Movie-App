import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetNowPlayingUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository _repository;

  GetNowPlayingUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters NoParameters) async {
    return await _repository.getNowPlaying();
  }
}
