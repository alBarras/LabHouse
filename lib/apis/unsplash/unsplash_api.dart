//API reference: https://unsplash.com/documentation#search-photos
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:labhouse_albert/apis/api_keys.dart';
import 'package:labhouse_albert/apis/google_cloud_translation/google_cloud_translation_api.dart';
import 'package:labhouse_albert/code_assets/strings.dart';
import 'package:labhouse_albert/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UnsplashApi {
  static bool showDebugMessages = false;
  static final List<String> PIC_RESOLUTIONS = ['thumb', 'small', 'regular', 'full'];

  ///Returns an URL String of a picture related with the given query and resolution (0=thumb, 1=small, 2=regular, 3=full)
  static Future<String> getRandomPic(int resolution) async {
    String apiKey = await getNextUnsplashApiKey();
    final res = await http.get(Uri.parse("https://api.unsplash.com/photos/?client_id=$apiKey"));
    //parse the response and get the 1st pic url with the desired resolution
    var data = jsonDecode(res.body);
    try {
      String picUrl = data[Utils.getRandomInt(0, data.length - 1)]['urls'][PIC_RESOLUTIONS[resolution]].toString(); //pic a random one from all the available pics
      return picUrl;
    } catch (e) {
      return "";
    }
  }

  ///Returns an URL String of a picture related with the given query and resolution (0=thumb, 1=small, 2=regular, 3=full)
  static Future<String> querySinglePic(String query, int resolution) async {
    String apiKey = await getNextUnsplashApiKey();
    final res = await http.get(Uri.parse("https://api.unsplash.com/search/photos?query=$query&per_page=10&client_id=$apiKey"));
    //parse the response and get the 1st pic url with the desired resolution
    try {
      var data = jsonDecode(res.body);
      String picUrl = data["results"][0]['urls'][PIC_RESOLUTIONS[resolution]].toString();
      return picUrl;
    } catch (e) {
      try {
        //if no pic URL is returned by the API because there is no match with the query, get a random one
        String randomPicUrl = await getRandomPic(resolution);
        return randomPicUrl;
      } catch (e) {
        return "";
      }
    }
  }

  ///Returns a List of URL Strings of pictures related with the given queries and resolution (0=thumb, 1=small, 2=regular, 3=full)
  static Future<List<String>> queryListOfPics(List<String> queries, int resolution) async {
    List<String> picUrls = List.filled(queries.length, "", growable: true);
    int doneCount = 0;
    //query all the url pics at the same time
    for (int i = 0; i < queries.length; i++) {
      GoogleCloudTranslationApi.translateFromSpanishToEnglish(queries[i]).then((translatedQuery) {
        querySinglePic(translatedQuery, resolution).then((result) {
          picUrls[i] = result; //make sure their position in the array is ok
          doneCount++;
        });
      });
    }
    //wait for all the url pics to be downloaded
    while (doneCount < queries.length) {
      await Future.delayed(const Duration(milliseconds: 200));
    }
    if (showDebugMessages) print("   Unsplash links: $picUrls");
    return picUrls;
  }

  static Future<String> getNextUnsplashApiKey() async {
    int nextKeyNum = 0;
    await SharedPreferences.getInstance().then((sharedPreferences) {
      nextKeyNum = ((sharedPreferences.getInt(LABHOUSE_UNSPLASH_API_KEY_NUM) ?? -1) + 1) % 5;
      sharedPreferences.setInt(LABHOUSE_UNSPLASH_API_KEY_NUM, nextKeyNum);
    });
    return UNSPLASH_API_KEYS[nextKeyNum];
  }
}
