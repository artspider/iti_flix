import 'package:iti_flix/core/clients/movie_api_client.dart';
import 'package:iti_flix/features/landing_page/data/datasources/movie_data_source.dart';
import 'package:iti_flix/features/landing_page/data/repositories/movie_repositorie.dart';
import 'package:iti_flix/features/landing_page/domain/usecases/movie_use_cases.dart';

class UseCasesConfig {
  late MovieApiClient _client;
  late MovieRemoteDataSourceImpl _dataSource;
  late MovieRepositorie _repositorie;
  late MovieUseCases useCases;

  UseCasesConfig() {
    _client = MovieApiClient();
    _dataSource = MovieRemoteDataSourceImpl(_client);
    _repositorie = MovieRepositorie(_dataSource);
    useCases = MovieUseCases(_repositorie);
  }
}
