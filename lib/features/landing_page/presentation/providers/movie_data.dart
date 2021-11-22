import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flix/core/usecases/use_cases_config.dart';
import 'package:iti_flix/features/landing_page/domain/entities/movie_entitie.dart';
import 'package:iti_flix/features/landing_page/domain/entities/top_movie_entitie.dart';

final movieData = Provider<MovieData>((ref) => MovieData());

class MovieData {
  final UseCasesConfig _movieConfig = UseCasesConfig();

  Future<List<TopMovie>> getPopular() async {
    return await _movieConfig.useCases.getPopular();
  }

  Future<List<TopMovie>> getTopRated() async {
    return await _movieConfig.useCases.getTopRated();
  }

  Future<List<TopMovie>> getNowPlaying() async {
    return await _movieConfig.useCases.getNowPlaying();
  }
}
