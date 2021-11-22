import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:iti_flix/core/utils/config.dart';

class MovieApiClient {
  dynamic get(String path, [bool details = false]) async {
    final queryParameters = {
      'api_key': Config.API_KEY,
    };
    var url = Uri.https(Config.BASE_URL, path, queryParameters);

    try {
      final response = await http.get(url);
      print('tratando de conectarse a $url ...');
      if (response.statusCode == 200) {
        String results = response.body;
        print('Conectado, obteniendo datos');
        if (!details) {
          Map dataMap = jsonDecode(response.body);
          List<dynamic> listResult = dataMap['results'];
          results = jsonEncode(listResult);
          print(results);
        }
        return results;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print('Hubo una excepción: ${e.toString()}');
      return null;
    }
  }
}
