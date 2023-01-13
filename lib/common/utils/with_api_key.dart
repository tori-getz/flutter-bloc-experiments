import 'package:flutter_dotenv/flutter_dotenv.dart';

String withApiKey(String route) {
  String apiKey = dotenv.env['API_KEY']!;
  return '$route?apiKey=$apiKey';
}
