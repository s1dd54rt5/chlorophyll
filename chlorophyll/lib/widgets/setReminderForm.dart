import 'dart:convert';
import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/prefs.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/screens/landingScreen.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderForm extends StatefulWidget {
  @override
  _ReminderFormState createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
  final TextEditingController title = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  final Map<String, bool> daysSelected = {
    "mon": false,
    "tue": false,
    "wed": false,
    "thu": false,
    "fri": false,
    "sat": false,
    "sun": false,
  };
  Map reminder = {};
  bool datePicked = false;
  List reminders = [];
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay pickedS = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (pickedS != null && pickedS != selectedTime)
      setState(() {
        selectedTime = pickedS;
      });
  }

  @override
  Widget build(BuildContext context) {
    var locally = getNotifHelper(context);
    SizeHelper s = SizeHelper(context);
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: s.wHelper(5),
          vertical: s.hHelper(3),
        ),
        height: s.hHelper(60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title",
              style: smallerTextBold,
            ),
            SizedBox(
              height: s.hHelper(1),
            ),
            TextFormField(
              style: smallTextLight,
              cursorColor: primaryGreen,
              controller: title,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: s.wHelper(5)),
                border: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                    color: primaryGreen,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: primaryGreen,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: primaryGreen,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                    color: Colors.redAccent,
                    width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  gapPadding: 1,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: primaryGreen,
                    width: 1,
                  ),
                ),
                hintText: "Enter name of Crop",
                hintStyle: smallTextLight,
              ),
            ),
            SizedBox(
              height: s.hHelper(2),
            ),
            Text(
              "Time",
              style: smallerTextBold,
            ),
            SizedBox(
              height: s.hHelper(1),
            ),
            GestureDetector(
              onTap: () {
                _selectTime(context);
                setState(() {
                  datePicked = true;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: s.wHelper(5)),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: s.hHelper(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primaryGreen),
                ),
                child: datePicked
                    ? Text(
                        selectedTime.hour.toString() +
                            ":" +
                            selectedTime.minute.toString(),
                        style: smallTextLight,
                        textAlign: TextAlign.left,
                      )
                    : Text(
                        "Pick a time",
                        style: smallTextLight,
                      ),
              ),
            ),
            SizedBox(
              height: s.hHelper(2),
            ),
            Text(
              "Days",
              style: smallerTextBold,
            ),
            SizedBox(
              height: s.hHelper(1),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      daysSelected["mon"] = !daysSelected["mon"];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: s.wHelper(3), vertical: s.hHelper(0.8)),
                    decoration: BoxDecoration(
                      color:
                          daysSelected["mon"] ? secondaryGreen : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryGreen),
                    ),
                    child: Text(
                      "MON",
                      style: smallTextLight,
                    ),
                  ),
                ),
                SizedBox(
                  width: s.wHelper(2),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      daysSelected["tue"] = !daysSelected["tue"];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: s.wHelper(3), vertical: s.hHelper(0.8)),
                    decoration: BoxDecoration(
                      color:
                          daysSelected["tue"] ? secondaryGreen : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryGreen),
                    ),
                    child: Text(
                      "TUE",
                      style: smallTextLight,
                    ),
                  ),
                ),
                SizedBox(
                  width: s.wHelper(2),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      daysSelected["wed"] = !daysSelected["wed"];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: s.wHelper(3), vertical: s.hHelper(0.8)),
                    decoration: BoxDecoration(
                      color:
                          daysSelected["wed"] ? secondaryGreen : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryGreen),
                    ),
                    child: Text(
                      "WED",
                      style: smallTextLight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: s.hHelper(0.8),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      daysSelected["thu"] = !daysSelected["thu"];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: s.wHelper(3), vertical: s.hHelper(0.8)),
                    decoration: BoxDecoration(
                      color:
                          daysSelected["thu"] ? secondaryGreen : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryGreen),
                    ),
                    child: Text(
                      "THU",
                      style: smallTextLight,
                    ),
                  ),
                ),
                SizedBox(
                  width: s.wHelper(2),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      daysSelected["fri"] = !daysSelected["fri"];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: s.wHelper(3), vertical: s.hHelper(0.8)),
                    decoration: BoxDecoration(
                      color:
                          daysSelected["fri"] ? secondaryGreen : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryGreen),
                    ),
                    child: Text(
                      "FRI",
                      style: smallTextLight,
                    ),
                  ),
                ),
                SizedBox(
                  width: s.wHelper(2),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      daysSelected["sat"] = !daysSelected["sat"];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: s.wHelper(3), vertical: s.hHelper(0.8)),
                    decoration: BoxDecoration(
                      color:
                          daysSelected["sat"] ? secondaryGreen : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryGreen),
                    ),
                    child: Text(
                      "SAT",
                      style: smallTextLight,
                    ),
                  ),
                ),
                SizedBox(
                  width: s.wHelper(2),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      daysSelected["sun"] = !daysSelected["sun"];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: s.wHelper(3), vertical: s.hHelper(0.8)),
                    decoration: BoxDecoration(
                      color:
                          daysSelected["sun"] ? secondaryGreen : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryGreen),
                    ),
                    child: Text(
                      "SUN",
                      style: smallTextLight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: s.hHelper(2),
            ),
            CustomButton(
              title: "Add reminder",
              onButtonPressed: () async {
                reminder["crop"] = title.text;
                reminder["time"] = selectedTime.hour.toString() +
                    ":" +
                    selectedTime.minute.toString();
                String days = "";
                daysSelected.forEach((key, value) {
                  if (value == true) {
                    days = days + key.toUpperCase() + " ";
                  }
                });
                var prefs = await getHelper();
                reminder["days"] = days;
                if (!prefs.containsKey("reminders")) {
                  reminders = [];
                } else {
                  reminders = jsonDecode(prefs.getString("reminders"));
                }
                reminders.add(reminder);
                prefs.setString("reminders", jsonEncode(reminders));
                locally.schedule(
                    title: "Reminder!",
                    message: title.text,
                    duration: Duration(seconds: 5));
                Get.to(
                  () => LandingScreen(
                    index: 0,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
