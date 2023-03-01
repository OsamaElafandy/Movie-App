class AppConst {
  static const String apiKey = "Put Your Key Here";
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey&language=en-US&page=1";
  static const String popularMoviesPath =
      "$baseUrl//movie/popular?api_key=$apiKey&language=en-US&page=1";
  static const String topRatedMoviesPath =
      "$baseUrl//movie/top_rated?api_key=$apiKey&language=en-US&page=1";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => '$baseImageUrl$path';

  //https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US

  static String moviesDetailsPath(int movieId) =>
      "$baseUrl//movie/$movieId?api_key=$apiKey&language=en-US";

  //https://api.themoviedb.org/3/movie/438148/recommendations?api_key=293b87dd26de104d89a11fa07dee5fd2&language=en-US&page=1

  static String moviesRecommendation(int movieId) =>
      "$baseUrl//movie/$movieId/recommendations?api_key=$apiKey&language=en-US&page=1";
}
