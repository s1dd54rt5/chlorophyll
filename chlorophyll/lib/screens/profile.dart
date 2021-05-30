import 'dart:convert';
import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/prefs.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/screens/loginScreen.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void initState() {
    getDetails();
    super.initState();
  }

  bool isLoading = false;

  Map<String, dynamic> userDetails = {};

  Future<void> getDetails() async {
    setState(() {
      isLoading = true;
    });
    var prefs = await getHelper();
    var json = prefs.getString("userDetails");
    userDetails = jsonDecode(json);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator()
          : Stack(
              children: [
                Positioned(
                  left: -120,
                  top: -120,
                  child: Container(
                    height: s.hHelper(50),
                    width: s.hHelper(50),
                    decoration: BoxDecoration(
                      color: secondaryGreen,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: s.wHelper(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: s.hHelper(8),
                      ),
                      Text(
                        "Profile",
                        style: bigTextBold,
                      ),
                      SizedBox(
                        height: s.hHelper(4),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Container(
                          height: s.hHelper(20),
                          width: s.hHelper(20),
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(300),
                          ),
                          padding: EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.network(
                              userDetails["image"],
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: s.hHelper(3),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          userDetails["name"],
                          style: smallTextBold,
                        ),
                      ),
                      SizedBox(
                        height: s.hHelper(1),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          userDetails["email"],
                          style: smallerTextBold,
                        ),
                      ),
                      SizedBox(
                        height: s.hHelper(5),
                      ),
                      CustomButton(
                        title: "Log Out",
                        onButtonPressed: () async {
                          var locally = getNotifHelper(context);
                          locally.cancelAll();
                          var pref = await getHelper();
                          pref.clear();
                          Get.to(() => LoginScreen());
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
