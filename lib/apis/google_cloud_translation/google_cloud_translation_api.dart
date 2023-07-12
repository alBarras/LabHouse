import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:labhouse_albert/apis/api_keys.dart';

class GoogleCloudTranslationApi {
  ///Translates a given String from spanish to english
  static Future<String> translateFromSpanishToEnglish(String str) async {
    final url = Uri.https('translation.googleapis.com', '/language/translate/v2', {
      'q': str,
      'source': 'es',
      'target': 'en',
      'format': 'text',
      'key': GOOGLE_CLOUD_TRANSLATION_API_KEY,
    });

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      final translatedText = jsonResponse['data']['translations'][0]['translatedText'];
      return translatedText;
    }
    return "";
  }
}
