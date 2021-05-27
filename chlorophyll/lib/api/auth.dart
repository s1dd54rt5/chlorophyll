import 'dart:convert';

import 'package:chlorophyll/helpers/prefs.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Map<String, String> userDetails = {};

Future<void> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  var credentials =
      await FirebaseAuth.instance.signInWithCredential(credential);
  userDetails["email"] = credentials.user.email;
  userDetails["name"] = credentials.user.displayName;
  userDetails["image"] = credentials.user.photoURL;
  userDetails["first_name"] =
      credentials.additionalUserInfo.profile["given_name"];
  var json = jsonEncode(userDetails);

  var pref = await getHelper();

  pref.setString("userDetails", json);
}
