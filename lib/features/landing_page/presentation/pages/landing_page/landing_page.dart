import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flix/core/utils/config.dart';
import 'package:iti_flix/features/landing_page/domain/entities/top_movie_entitie.dart';
import 'package:iti_flix/features/landing_page/presentation/pages/featured_movie.dart';
import 'package:iti_flix/features/landing_page/presentation/pages/now_playing_movies/now_playing_movies.dart';
import 'package:iti_flix/features/landing_page/presentation/pages/popular_movies/popular_movies.dart';
import 'package:iti_flix/features/landing_page/presentation/pages/top_rated_movies/top_rated_movies.dart';
import 'package:iti_flix/features/landing_page/presentation/providers/provider.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<TopMovie>> popMovies = ref.watch(popularMovies);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: SingleChildScrollView(
          child: Column(
            children:  [
             FeaturedMovie(),
              PopularMovies(),
              TopRatedMovies(),
              NowPlayingMovies(),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

 
}
