import 'package:arch/core/util/enums.dart';
import 'package:arch/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState(
      this.nowPlayingMovies,
      this.nowPlayingState,
      this.nowPlayingMessage,
      this.popularMovies,
      this.popularState,
      this.popularMessage,
      this.topRatedMovies,
      this.topRatedState,
      this.topRatedMessage);

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies ?? this.popularMovies,
      popularState ?? this.popularState,
      popularMessage ?? this.popularMessage,
      topRatedMovies ?? this.topRatedMovies,
      topRatedState ?? this.topRatedState,
      topRatedMessage ?? this.topRatedMessage,
    );
  }

  factory MoviesState.initial() {
    return const MoviesState(
      [],
      RequestState.idle,
      '',
      [],
      RequestState.idle,
      '',
      [],
      RequestState.idle,
      '',
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage
      ];
}
