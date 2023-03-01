import 'package:arch/movies/data/datasourse/movie_remote_datasource.dart';
import 'package:arch/movies/data/repository/movies_repository.dart';
import 'package:arch/movies/domain/repository/base_movie_repository.dart';
import 'package:arch/movies/domain/usecase/get_nowPlaying_movies.dart';
import 'package:arch/movies/domain/usecase/get_popular_movies.dart';
import 'package:arch/movies/domain/usecase/get_topRated_movies.dart';
import 'package:arch/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../movies/domain/usecase/get_movie_detail.dart';
import '../../movies/domain/usecase/get_recommends.dart';
import '../../movies/presentation/controller/bloc/movie_detail_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //?  DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    //?  Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    //?  UseCase
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendsUseCase(sl()));

    //?  Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailBloc(sl(), sl()));
  }
}
