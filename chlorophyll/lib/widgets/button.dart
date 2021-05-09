import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onButtonPressed;
  CustomButton({@required this.title, this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return GestureDetector(
      onTap: () {
        onButtonPressed();
      },
      child: Container(
        height: s.hHelper(6),
        decoration: BoxDecoration(
          color: primaryGreen,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: buttonText,
        ),
      ),
    );
  }
}
