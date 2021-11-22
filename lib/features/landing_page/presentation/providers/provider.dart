import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flix/features/landing_page/presentation/providers/movie_data.dart';

final popularMovies = FutureProvider((ref) async {
  return ref.read(movieData).getPopular();
});

final topRatedMovies = FutureProvider((ref) async {
  return ref.read(movieData).getTopRated();
});

final nowPlayingdMovies = FutureProvider((ref) async {
  return ref.read(movieData).getNowPlaying();
});
