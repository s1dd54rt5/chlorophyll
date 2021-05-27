import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> getHelper() async {
  return await SharedPreferences.getInstance();
}
