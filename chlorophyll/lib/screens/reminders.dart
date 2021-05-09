import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:flutter/material.dart';

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
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
                height: s.hHelper(4),
              ),
              SizedBox(
                height: s.hHelper(4),
              ),
              CustomButton(
                title: "Set new reminders",
                onButtonPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
