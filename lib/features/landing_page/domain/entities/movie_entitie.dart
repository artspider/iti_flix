import 'package:equatable/equatable.dart';

class Movie extends Equatable{

  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object> get props => [adult, backdropPath, belongsToCollection, budget, genres, homepage, id, imdbId,
                             originalLanguage, originalTitle, overview, popularity, posterPath, releaseDate,
                             revenue, runtime, status, tagline, title, video, voteAverage, voteCount];

  @override
  bool get stringify => true;
}

class Genre {
  Genre({
        required this.id,
        required this.name,
    });

    final int id;
    final String name;
}