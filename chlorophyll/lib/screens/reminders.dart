import 'dart:convert';

import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/prefs.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:chlorophyll/widgets/reminderCard.dart';
import 'package:chlorophyll/widgets/setReminderForm.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  void initState() {
    getData();
    super.initState();
  }

  Map myval = {};

  bool isLoading = false;
  SharedPreferences pref;

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });
    pref = await getHelper();
    if (!pref.containsKey("reminders")) {
      reminders = [];
    } else {
      reminders = jsonDecode(pref.getString("reminders"));
    }
    setState(() {
      isLoading = false;
    });
  }

  List reminders = [];
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(primaryGreen),
            ),
          )
        : SingleChildScrollView(
            child: Stack(
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
                  child: reminders.length == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: s.hHelper(8),
                            ),
                            Text(
                              "Reminders",
                              style: bigTextBold,
                            ),
                            SizedBox(
                              height: s.hHelper(2),
                            ),
                            Text(
                              "You don't have any reminders",
                              style: smallerTextBold,
                            ),
                            SizedBox(
                              height: s.hHelper(4),
                            ),
                            CustomButton(
                              title: "Set new reminders",
                              onButtonPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => ReminderForm(),
                                );
                              },
                            ),
                            SizedBox(
                              height: s.hHelper(10),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: s.hHelper(8),
                            ),
                            Text(
                              "Reminders",
                              style: bigTextBold,
                            ),
                            SizedBox(
                              height: s.hHelper(2),
                            ),
                            for (var reminder in reminders)
                              ReminderCard(
                                crop: reminder["crop"],
                                days: reminder["days"].toString(),
                                time: reminder["time"],
                              ),
                            SizedBox(
                              height: s.hHelper(4),
                            ),
                            CustomButton(
                              title: "Set new reminders",
                              onButtonPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => ReminderForm(),
                                );
                              },
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
  }
}
