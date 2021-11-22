// To parse this JSON data, do
//
//     final topMovieModel = topMovieModelFromJson(jsonString);

import 'dart:convert';

import 'package:iti_flix/features/landing_page/domain/entities/top_movie_entitie.dart';

List<TopMovieModel> topMovieModelFromJson(String str) => 
  List<TopMovieModel>.from(json.decode(str).map((x) => 
    TopMovieModel.fromJson(x)));

String topMovieModelToJson(List<TopMovieModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopMovieModel extends TopMovie{

    const TopMovieModel({
        required bool adult,
        required String backdropPath,
        required List<int> genreIds,
        required int id,
        required String originalLanguage,
        required String originalTitle,
        required String overview,
        required double popularity,
        required String posterPath,
        required DateTime releaseDate,
        required String title,
        required bool video,
        required double voteAverage,
        required int voteCount,
    }): super( adult: adult, backdropPath:backdropPath, genreIds: genreIds, id: id, originalLanguage: originalLanguage,
                originalTitle: originalTitle, overview: overview, popularity: popularity, posterPath:posterPath,
                releaseDate: releaseDate, title: title, video: video, voteAverage: voteAverage, voteCount: voteCount);


    factory TopMovieModel.fromJson(Map<String, dynamic> json) => TopMovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
