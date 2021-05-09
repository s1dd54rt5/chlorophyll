import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/screens/dashboard.dart';
import 'package:chlorophyll/screens/fertiliser.dart';
import 'package:chlorophyll/screens/reminders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState(currentIndex: 1);
}

class _LandingScreenState extends State<LandingScreen> {
  final tabs = [
    Reminders(),
    Dashboard(),
    Fertiliser(),
  ];

  int currentIndex;
  _LandingScreenState({@required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 8,
          selectedItemColor: primaryGreen,
          unselectedItemColor: grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            HapticFeedback.lightImpact();
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.time,
              ),
              label: "Reminders",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.tree,
              ),
              label: "Fertiliser",
            ),
          ],
        ),
        body: tabs[currentIndex],
      ),
    );
  }
}
