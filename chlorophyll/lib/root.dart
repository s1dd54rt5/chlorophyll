import 'package:chlorophyll/helpers/prefs.dart';
import 'package:chlorophyll/screens/landingScreen.dart';
import 'package:chlorophyll/screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    isSignin();
    super.initState();
  }

  bool signedIn = false;

  Future isSignin() async {
    var pref = await getHelper();
    if (pref.containsKey("userDetails")) {
      signedIn = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print("Error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: Color(0xff20F284),
            ),
            debugShowCheckedModeBanner: false,
            home: signedIn ? LandingScreen() : LoginScreen(),
          );
        }

        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
