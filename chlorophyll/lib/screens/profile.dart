import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Scaffold(
      body: Stack(
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
                    child: Container(
                      height: s.hHelper(18),
                      width: s.hHelper(18),
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(300),
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
                    "Siddharth Singh",
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
                    "siddharthsingh3700@gmail.com",
                    style: smallerTextBold,
                  ),
                ),
                SizedBox(
                  height: s.hHelper(1),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    "+91 9909666900",
                    style: smallerTextBold,
                  ),
                ),
                SizedBox(
                  height: s.hHelper(4),
                ),
                CustomButton(
                  title: "Log Out",
                  onButtonPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
