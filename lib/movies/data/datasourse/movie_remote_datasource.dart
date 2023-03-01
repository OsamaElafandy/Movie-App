import 'dart:developer';

import 'package:arch/core/constant.dart';
import 'package:arch/movies/data/model/movie_model.dart';
import 'package:dio/dio.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecase/get_movie_detail.dart';
import '../../domain/usecase/get_recommends.dart';
import '../model/movie_detail_model.dart';
import '../model/recommend_model.dart';

// contract
abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetail(MovieDetailUseCaseParams params);
  Future<List<RecommendModel>> getRecommends(RecommendsUseCaseParam params);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    String url = AppConst.nowPlayingMoviesPath;
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    String url = AppConst.popularMoviesPath;
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    String url = AppConst.topRatedMoviesPath;
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(
      MovieDetailUseCaseParams params) async {
    String url = AppConst.moviesDetailsPath(params.movieId);
    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerExceptions(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendModel>> getRecommends(
      RecommendsUseCaseParam params) async {
    String url = AppConst.moviesRecommendation(params.movieId);
    final response = await Dio().get(url);
    if (response.statusCode == 200) {
      return List<RecommendModel>.from((response.data['results'] as List)
          .map((e) => RecommendModel.fromJson(e)));
    } else {
      throw ServerExceptions(ErrorMessageModel.fromJson(response.data));
    }
  }
}
