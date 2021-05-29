import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:chlorophyll/widgets/reminderCard.dart';
import 'package:chlorophyll/widgets/setReminderForm.dart';
import 'package:flutter/material.dart';

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  List reminders = [
    {
      "crop": "Wheat",
      "time": "7:30 AM",
      "days": "MON, TUE, WED",
    },
    {
      "crop": "Rice",
      "time": "8:30 AM",
      "days": "TUE, WED",
    },
    {
      "crop": "Maize",
      "time": "7:30 PM",
      "days": "MON, TUE, FRI",
    },
  ];
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Stack(
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
                "Reminders",
                style: bigTextBold,
              ),
              SizedBox(
                height: s.hHelper(2),
              ),
              for (var reminder in reminders)
                ReminderCard(
                  crop: reminder["crop"],
                  days: reminder["days"],
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
