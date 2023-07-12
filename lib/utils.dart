import 'dart:io';
import 'dart:math';

class Utils {
  ///Get a random int between 'min' and 'max', both included
  static int getRandomInt(int min, int max) {
    return min + Random().nextInt(max - min + 1);
  }

  ///Get a random double between 'min' and 'max', both included
  static double getRandomDouble(double min, double max) {
    return min + Random().nextDouble() * (max - min);
  }

  ///Remove the blank spaces and line breaks from a String in the start and/or end
  static String quitBlankSpacesStartEnd(String s, bool quitStart, bool quitEnd) {
    if (quitStart) {
      while (s.startsWith(' ') || s.startsWith('\n')) {
        s = s.substring(1);
      }
    }
    if (quitEnd) {
      while (s.endsWith(' ') || s.endsWith('\n')) {
        s = s.substring(0, s.length - 1);
      }
    }
    return s;
  }

  ///Set the 1st char in a String to be capital
  static String makeFirstCharCapital(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }

  ///Returns true if there is internet connection
  static Future<bool> isInternet() async {
    try {
      final response = await InternetAddress.lookup('google.com');
      if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {}
    return false;
  }
}
