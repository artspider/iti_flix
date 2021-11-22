// Repositorio del modelo Movie == Capa Domain
// Es la interface (Clase Abstracta o contrato) que indica lo que se tiene que implementar

import 'package:iti_flix/features/landing_page/domain/entities/movie_entitie.dart';
import 'package:iti_flix/features/landing_page/domain/entities/top_movie_entitie.dart';

abstract class IMovieRepository {
  Future<List<TopMovie>> getLatest();
  Future<List<TopMovie>> getNowPlaying();
  Future<List<TopMovie>> getPopular();
  Future<List<TopMovie>> getTopRated();
  Future<List<TopMovie>> getUpcoming();
  Future<List<TopMovie>> getSimilarMovies(int movieId);
  Future<List<Movie>> getDetails(int movieId);
}
