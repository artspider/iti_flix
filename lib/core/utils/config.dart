class Config {
  Config._();

  static const String BASE_URL = "api.themoviedb.org";
  static const String BASE_IMAGE_URL = "https://image.tmdb.org/t/p";
  static const String SIZE_200 = "/w200";
  static const String SIZE_300 = "/w300";
  static const String SIZE_400 = "/w400";
  static const String SIZE_500 = "/w500";


  static const String uriGetDetails = '/3/movie'; //espera el id de la entidad Movie
  static const String uriGetLatest = '/3/movie/latest';
  static const String uriGetNowPlaying = '/3/movie/now_playing';
  static const String uriGetNowPopular = '/3/movie/popular';
  static const String uriGetNowTopRated = '/3/movie/top_rated';
  static const String uriGetNowUpcoming = '/3/movie/upcoming';
  static const String uriGetSimilar = '/3/similar';

  static const String API_KEY = "196a545c0c6b8bb2fc5182a47e3b67a9";
}
