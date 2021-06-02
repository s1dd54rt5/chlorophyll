import 'dart:convert';
import 'package:chlorophyll/constants/url.dart';
import 'package:chlorophyll/constants/keys.dart';
import 'package:http/http.dart' as http;

class Weather {
  Future<Map<String, dynamic>> getWeatherDetails(
      String latitude, String longitude) async {
    Map<String, dynamic> res = {};
    var url = Uri.parse(weather +
        "?lat=$latitude&lon=$longitude&units=metric&appid=" +
        weatherKey);
    try {
      var response = await http.get(url);
      res = jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
    return res;
  }
}
