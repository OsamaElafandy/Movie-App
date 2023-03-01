import 'dart:async';

import 'package:arch/core/util/enums.dart';
import 'package:arch/movies/domain/usecase/get_movie_detail.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_detail.dart';
import '../../../domain/entities/recommends.dart';
import '../../../domain/usecase/get_recommends.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendsUseCase getRecommendsUseCase;
  MovieDetailBloc(this.getMovieDetailUseCase, this.getRecommendsUseCase)
      : super(const MovieDetailState(
          null,
          RequestState.idle,
          '',
          null,
          RequestState.idle,
          '',
        )) {
    on<GetMovieDetailEvent>(_getMovieDetailEvent);
    on<GetRecommendsEvent>(_getRecommends);
  }

  FutureOr<void> _getMovieDetailEvent(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    emit(state.copyWith(movieDetailState: RequestState.loading));
    final result =
        await getMovieDetailUseCase(MovieDetailUseCaseParams(event.id));

    result.fold(
        (failure) => state.copyWith(
            movieDetailState: RequestState.error,
            movieDetailMessage: failure.message),
        (movieDetail) => emit(
              state.copyWith(
                  movieDetail: movieDetail,
                  movieDetailState: RequestState.success),
            ));
  }

  FutureOr<void> _getRecommends(
      GetRecommendsEvent event, Emitter<MovieDetailState> emit) async {
    emit(state.copyWith(recommendsState: RequestState.loading));
    final result = await getRecommendsUseCase(RecommendsUseCaseParam(event.id));

    result.fold(
        (failure) => state.copyWith(
            recommendsState: RequestState.error,
            recommendsMessage: failure.message),
        (recommends) => emit(
              state.copyWith(
                  recommends: recommends,
                  recommendsState: RequestState.success),
            ));
  }
}
