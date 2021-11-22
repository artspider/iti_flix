
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iti_flix/core/utils/config.dart';
import 'package:iti_flix/features/landing_page/domain/entities/top_movie_entitie.dart';
import 'package:iti_flix/features/landing_page/presentation/providers/provider.dart';

class TopRatedMovies extends ConsumerWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<TopMovie>> topMovies = ref.watch(topRatedMovies);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text('Mejor calificadas', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(
          height: 5,
        ),
        Container(
            height: 150,            
            child: topMovies.when(
                data: (topMovies) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topMovies.length,
                    itemBuilder: (context, index) {
                       String featuredImage = Config.BASE_IMAGE_URL +
                       Config.SIZE_200 + topMovies[index].posterPath;
                      return Container(
                        width: 100,
                        height: 150,
                        margin: EdgeInsets.only(right: 10),
                        color: Colors.red,
                        child: Image.network(featuredImage)
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
}