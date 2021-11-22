// Casos de uso del Modelo Movie == Capa Domain
// Todos los casos de uso utilizan un DataSource

import 'package:iti_flix/features/landing_page/domain/entities/movie_entitie.dart';
import 'package:iti_flix/features/landing_page/domain/entities/top_movie_entitie.dart';
import 'package:iti_flix/features/landing_page/domain/repositories/movie_repository.dart';

class MovieUseCases {
  final IMovieRepository movieRepository;

  MovieUseCases(this.movieRepository);

  Future<List<TopMovie>> getLatest() async{
    return await movieRepository.getLatest();
  }

  Future<List<TopMovie>> getNowPlaying() async{
    return await movieRepository.getNowPlaying();
  }

  Future<List<TopMovie>> getPopular() async{
    return await movieRepository.getPopular();
  }

  Future<List<TopMovie>> getTopRated() async{
    return await movieRepository.getTopRated();
  }

  Future<List<TopMovie>> getUpcoming() async{
    return await movieRepository.getUpcoming();
  }

  Future<List<TopMovie>> getSimilarMovies(int movieId) async{
    return await movieRepository.getSimilarMovies(movieId);
  }

  Future<List<Movie>> getDetails(int movieId) async{
    return await movieRepository.getDetails(movieId);
  }
}
