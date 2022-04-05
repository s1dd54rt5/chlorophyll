import 'dart:convert';
import 'dart:io';

import 'package:chlorophyll/constants/keys.dart';
import 'package:chlorophyll/constants/url.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getSoilData(
    String latitude, String longitude) async {
  Map<String, dynamic> res = {};
  var url = Uri.parse(ambee + "?lat=$latitude&lng=$longitude");
  try {
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "x-api-key": ambeeKey,
      },
    );
    res = jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
  return res;
}

Future<Map<String, dynamic>> getWaterData(
    String latitude, String longitude) async {
  Map<String, dynamic> res = {};
  var url = Uri.parse(ambeeWater + "?lat=$latitude&lng=$longitude");
  try {
    var response = await http.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        "x-api-key": ambeeKey,
      },
    );
    res = jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
  return res;
}
