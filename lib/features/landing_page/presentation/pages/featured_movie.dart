import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flix/core/utils/config.dart';
import 'package:iti_flix/features/landing_page/domain/entities/top_movie_entitie.dart';
import 'package:iti_flix/features/landing_page/presentation/providers/provider.dart';

class FeaturedMovie extends ConsumerWidget {
  const FeaturedMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<TopMovie>> popMovies = ref.watch(popularMovies);
    return Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(),
        width: double.infinity,
        //height: 500,
        child: popMovies.when(
            data: (popMovies) {
              String featuredImage = Config.BASE_IMAGE_URL +
                  Config.SIZE_400 +
                  popMovies.first.posterPath;
              print("La imagen: $featuredImage");
              return InkWell(
                child: Image.network(
                  featuredImage,
                  fit: BoxFit.cover,
                ),
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => buildSheet(popMovies.first),
                ),
              );
            },
            error: (err, stack) => Center(child: Text(err.toString())),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
  Widget buildSheet(TopMovie movie) => Container(
    height: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    color: Colors.black,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movie.title, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
        SizedBox(height: 10,),
        Text('Año de lanzamiento: ' + movie.releaseDate.year.toString(), style: TextStyle(color: Colors.white60, fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(              
              width: 120,
              height: 180,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Image.network(
                Config.BASE_IMAGE_URL +
                Config.SIZE_400 +
                movie.posterPath,
                fit: BoxFit.cover
              ),
            ),
            Container(
              width: 180,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              child: Text(
                movie.overview, 
                softWrap: true, 
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14, 
                  fontWeight: 
                  FontWeight.w300,
                  letterSpacing: 1.5,
                  wordSpacing: 1.5
                  )
                )
            ),
          ],          
        ),
        Row(
          children: [
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {}, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow),
                    SizedBox(width: 5,),
                    Text(
                      'Ver', 
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, 
                      fontWeight: 
                      FontWeight.w700,
                      letterSpacing: 1.5,
                      wordSpacing: 1.5
                      )
                    ),
                  ],
                ), style: ButtonStyle(),
              )
            )
          ],
        ),
      ],
    ),
  );
}


