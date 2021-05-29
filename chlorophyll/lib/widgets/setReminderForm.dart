import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:flutter/material.dart';

class ReminderForm extends StatefulWidget {
  @override
  _ReminderFormState createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
  final TextEditingController title = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  final Map<String, bool> daySelected = {
    "mon": false,
    "tue": false,
    "wed": false,
    "thu": false,
    "fri": false,
    "sat": false,
    "sun": false,
  };

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay pickedS = await showTimePicker(
        context: context,
        initialTime: selectedTime,
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
    SizeHelper s = SizeHelper(context);
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: s.wHelper(5),
          vertical: s.hHelper(3),
        ),
        height: s.hHelper(50),
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
              height: s.hHelper(1),
            ),
            Text(
              "Time",
              style: smallerTextBold,
            ),
            SizedBox(
              height: s.hHelper(1),
            ),
            TextButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text("pres"),
            )
          ],
        ),
      ),
    );
  }
}
