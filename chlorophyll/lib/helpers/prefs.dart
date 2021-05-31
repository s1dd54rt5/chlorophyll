import 'package:chlorophyll/screens/landingScreen.dart';
import 'package:flutter/material.dart';
import 'package:locally/locally.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getHelper() async {
  return await SharedPreferences.getInstance();
}

Locally getNotifHelper(BuildContext context) {
  Locally locally = new Locally(
    context: context,
    pageRoute: MaterialPageRoute(builder: (context) => LandingScreen(index: 1)),
    appIcon: 'mipmap/ic_launcher',
    payload: "test",
  );
  return locally;
}
