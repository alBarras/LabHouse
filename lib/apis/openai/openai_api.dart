import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:labhouse_albert/apis/api_keys.dart';
import 'package:labhouse_albert/apis/openai/model_openAi_completionsResponse.dart';
import 'package:labhouse_albert/utils.dart';

class OpenaiApi {
  static bool showDebugMessages = true;
  static final Uri completionsEndpoint = Uri.parse('https://api.openai.com/v1/completions');
  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $OPENAI_API_KEY',
  };

  ///Get a List of pairs of Strings (the answer and its keyword for each) for the given query
  static Future<List> getItemsWithKeywordList(String query, int amountItems, int limitCharsPerItem, int callNum) async {
    //Query
    int maxTokens = 1024; //min=256, max=1792
    double temperature = Utils.getRandomDouble(0.3, 0.8); //min=0, max=2
    String sentPrompt =
        "Crea una lista enumerada en formato JSON de $amountItems items de $query. Cada item debe tener los campos 'text', 'keyword' y 'description', los dos primeros de no más de 30 caracteres. Por ejemplo, una lista enumerada en formato JSON de 3 items de recetas fáciles podría ser {'1':{'text':'hamburguesa con queso','keyword':'hamburguesa','description':'Plato muy fácil de hacer común en la cocina occidental.'},'2':{'text':'pollo a la parrilla','keyword':'pollo','description':'Solo es necesario cocinar el pollo a la parrilla, puede añadírsele opcionalmente alguna salsa.'},'3':{'text':'salteado de setas y verduras','keyword':'verduras','description':'Cortar a trocitos las setas y verduras y saltearlas lentamente con un poco de aceite.'}}";
    String request = jsonEncode({
      "model": "text-davinci-003",
      "prompt": sentPrompt,
      "max_tokens": maxTokens,
      "temperature": temperature,
    });
    if (showDebugMessages) print("   OpenAI: waiting for response...");
    try {
      http.Response response = await http.post(completionsEndpoint, headers: headers, body: request);
      if (showDebugMessages) print("   OpenAI response.statusCode: ${response.statusCode}");
      //Response
      if (response.statusCode == 200) {
        String? responseStr = ModelCompletionsResponse.fromResponse(response).firstCompletion?.trim();
        if (responseStr != null) {
          //No Error
          int tokensUsed = ModelCompletionsResponse.fromResponse(response).totalTokens ?? -1;
          if (showDebugMessages) print("   OpenAI tokens used: $tokensUsed");
          if (showDebugMessages) print("\n   OpenAI response:\n$responseStr\n");
          return parseItemsWithKeywordList(responseStr, callNum);
        }
      }
    } catch (e) {}
    //Error
    return [];
  }

  ///Converts a String like '{'1':{'text':'1text','keyword':'1keyword'},'2':{'text':'2text','keyword':'2keyword'},'3':{'text':'3text','keyword':'3keyword'}}' to [['1text','2text','3text'],['1keyword','2keyword','3keyword']]
  static List parseItemsWithKeywordList(String itemsWithKeywordStr, int callNum) {
    Map<String, dynamic> map = jsonDecode(itemsWithKeywordStr.replaceAll("'", "\""));
    List<List<String>> itemsWithKeywordList = [[], [], []];
    map.forEach((key, value) {
      itemsWithKeywordList[0].add(value['text']);
      itemsWithKeywordList[1].add(value['keyword']);
      itemsWithKeywordList[2].add(value['description']);
    });
    if (showDebugMessages) print("\n   OpenAI parsed list with keyword:\n$itemsWithKeywordList\n");
    return [itemsWithKeywordList, callNum];
  }
}
