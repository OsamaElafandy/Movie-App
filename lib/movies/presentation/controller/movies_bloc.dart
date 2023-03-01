import 'dart:async';

import 'package:arch/movies/domain/usecase/get_nowPlaying_movies.dart';
import 'package:arch/movies/domain/usecase/get_popular_movies.dart';
import 'package:arch/movies/domain/usecase/get_topRated_movies.dart';
import 'package:arch/movies/presentation/controller/movies_event.dart';
import 'package:arch/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/usecase/base_use_case.dart';
import '../../../core/util/enums.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(MoviesState.initial()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(nowPlayingState: RequestState.loading));
    final result = await getNowPlayingUseCase(const NoParameters());
    result.fold(
      (failure) => emit(state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: failure.message)),
      (movies) => emit(state.copyWith(
          nowPlayingState: RequestState.success, nowPlayingMovies: movies)),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(popularState: RequestState.loading));
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
      (failure) => emit(state.copyWith(
          popularState: RequestState.error, popularMessage: failure.message)),
      (movies) => emit(state.copyWith(
          popularState: RequestState.success, popularMovies: movies)),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(topRatedState: RequestState.loading));
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
      (failure) => emit(state.copyWith(
          topRatedState: RequestState.error, topRatedMessage: failure.message)),
      (movies) => emit(state.copyWith(
          topRatedState: RequestState.success, topRatedMovies: movies)),
    );
  }
}
