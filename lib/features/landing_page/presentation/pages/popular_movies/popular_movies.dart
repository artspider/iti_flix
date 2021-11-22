import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flix/core/utils/config.dart';
import 'package:iti_flix/features/landing_page/domain/entities/top_movie_entitie.dart';
import 'package:iti_flix/features/landing_page/presentation/providers/provider.dart';

class PopularMovies extends ConsumerWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<TopMovie>> popMovies = ref.watch(popularMovies);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text('Populares en ITIFlix', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(
          height: 5,
        ),
        Container(
            height: 150,
            
            child: popMovies.when(
                data: (popMovies) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popMovies.length,
                    itemBuilder: (context, index) {
                       String featuredImage = Config.BASE_IMAGE_URL +
                       Config.SIZE_200 + popMovies[index].posterPath;
                      return InkWell(
                        child: Container(
                          width: 100,
                          height: 150,
                          margin: EdgeInsets.only(right: 10),
                          color: Colors.red,
                          child: Image.network(featuredImage)
                        ),
                        onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => buildSheet(popMovies[index]),
                        ),
                      );
                    },
                  );
                },
                error: (err, stack) => Center(
                      child: Text(err.toString()),
                    ),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ))),
      ],
    );
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
              child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                text: TextSpan(
                  text: movie.overview,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14, 
                    fontWeight: 
                    FontWeight.w300,
                    letterSpacing: 1.5,
                    wordSpacing: 1.5
                  )
                )
              )
              /* Text(
                movie.overview, 
                softWrap: true,
                 overflow: TextOverflow.,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14, 
                  fontWeight: 
                  FontWeight.w300,
                  letterSpacing: 1.5,
                  wordSpacing: 1.5
                  )
                ) */
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
