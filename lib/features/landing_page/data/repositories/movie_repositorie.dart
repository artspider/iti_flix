import 'package:iti_flix/features/landing_page/data/datasources/movie_data_source.dart';
import 'package:iti_flix/features/landing_page/data/models/top_movie_model.dart';
import 'package:iti_flix/features/landing_page/domain/entities/movie_entitie.dart';
import 'package:iti_flix/features/landing_page/domain/repositories/movie_repository.dart';

class MovieRepositorie implements IMovieRepository {
  final MovieRemoteDataSource _dataSource;

  MovieRepositorie(this._dataSource);

  @override
  Future<List<Movie>> getDetails(int movieId) async {
    return await _dataSource.getDetails(movieId);
  }

  @override
  Future<List<TopMovieModel>> getLatest() async {
    return await _dataSource.getLatest();
  }

  @override
  Future<List<TopMovieModel>> getNowPlaying() async {
    return await _dataSource.getNowPlaying();
  }

  @override
  Future<List<TopMovieModel>> getPopular() async {
    return await _dataSource.getPopular();
  }

  @override
  Future<List<TopMovieModel>> getSimilarMovies(int movieId) async {
    return await _dataSource.getSimilarMovies(movieId);
  }

  @override
  Future<List<TopMovieModel>> getTopRated() async {
    return await _dataSource.getTopRated();
  }

  @override
  Future<List<TopMovieModel>> getUpcoming() async {
    return await _dataSource.getUpcoming();
  }

  
}
