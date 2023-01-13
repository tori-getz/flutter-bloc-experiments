import 'package:flutter_bloc_app/common/utils/with_api_key.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  Endpoints._();

  static String apiKey = dotenv.env['API_KEY']!;

  static String baseUrl = dotenv.env['API_URL']!;

  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;

  static String articles = '/everything?q=bitcoin&language=ru&apikey=$apiKey';
}
