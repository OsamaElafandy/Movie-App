part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailState;
  final String movieDetailMessage;

  final List<Recommends>? recommends;
  final RequestState recommendsState;
  final String recommendsMessage;

  const MovieDetailState(
    this.movieDetail,
    this.movieDetailState,
    this.movieDetailMessage,
    this.recommends,
    this.recommendsState,
    this.recommendsMessage,
  );

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailMessage,
    List<Recommends>? recommends,
    RequestState? recommendsState,
    String? recommendsMessage,
  }) {
    return MovieDetailState(
      movieDetail ?? this.movieDetail,
      movieDetailState ?? this.movieDetailState,
      movieDetailMessage ?? this.movieDetailMessage,
      recommends ?? this.recommends,
      recommendsState ?? this.recommendsState,
      recommendsMessage ?? this.recommendsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailState,
        movieDetailMessage,
        recommends,
        recommendsState,
        recommendsMessage,
      ];
}
