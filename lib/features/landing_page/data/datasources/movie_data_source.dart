import 'package:iti_flix/core/clients/movie_api_client.dart';
import 'package:iti_flix/core/utils/config.dart';
import 'package:iti_flix/features/landing_page/data/models/movie_model.dart';
import 'package:iti_flix/features/landing_page/data/models/top_movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<TopMovieModel>> getLatest();
  Future<List<TopMovieModel>> getNowPlaying();
  Future<List<TopMovieModel>> getPopular();
  Future<List<TopMovieModel>> getTopRated();
  Future<List<TopMovieModel>> getUpcoming();
  Future<List<TopMovieModel>> getSimilarMovies(int movieId);
  Future<List<MovieModel>> getDetails(int movieId);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final MovieApiClient _movieApiClient;

  MovieRemoteDataSourceImpl(this._movieApiClient);

  @override
  Future<List<MovieModel>> getDetails(int movieId) async {
    final String uri =
        Config.uriGetDetails + '/' + movieId.toString() + Config.API_KEY;
    final response = await _movieApiClient.get(uri);
    final List<MovieModel> movie = movieModelFromJson(response.body);
    print('Movie Model:');
    print(movie.first);
    return movie;
  }

  @override
  Future<List<TopMovieModel>> getLatest() async {
    final String uri = Config.uriGetLatest + Config.API_KEY;
    final response = await _movieApiClient.get(uri);
    final List<TopMovieModel> movies = topMovieModelFromJson(response.body);
    return movies;
  }

  @override
  Future<List<TopMovieModel>> getNowPlaying() async {
    final String uri = Config.uriGetNowPlaying;
    final response = await _movieApiClient.get(uri);
    final List<TopMovieModel> movies = topMovieModelFromJson(response);
    return movies;
  }

  @override
  Future<List<TopMovieModel>> getPopular() async {
    final String uri = Config.uriGetNowPopular;
    final response = await _movieApiClient.get(uri);
    final List<TopMovieModel> movies = topMovieModelFromJson(response);
    return movies;
  }

  @override
  Future<List<TopMovieModel>> getSimilarMovies(int movieId) async {
    final String uri = Config.uriGetDetails +
        '/' +
        movieId.toString() +
        Config.uriGetSimilar +
        Config.API_KEY;
    final response = await _movieApiClient.get(uri);
    final List<TopMovieModel> movies = topMovieModelFromJson(response.body);
    return movies;
  }

  @override
  Future<List<TopMovieModel>> getTopRated() async {
    final String uri = Config.uriGetNowTopRated;
    final response = await _movieApiClient.get(uri);
    final List<TopMovieModel> movies = topMovieModelFromJson(response);
    return movies;
  }

  @override
  Future<List<TopMovieModel>> getUpcoming() async {
    final String uri = Config.uriGetNowUpcoming + Config.API_KEY;
    final response = await _movieApiClient.get(uri);
    final List<TopMovieModel> movies = topMovieModelFromJson(response.body);
    return movies;
  }
}
