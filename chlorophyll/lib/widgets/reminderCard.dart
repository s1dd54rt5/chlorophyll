import 'package:chlorophyll/constants/svgConst.dart';
import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ReminderCard extends StatefulWidget {
  final String crop;
  final String time;
  final String days;
  ReminderCard({@required this.crop, @required this.days, @required this.time});
  @override
  _ReminderCardState createState() => _ReminderCardState();
}

class _ReminderCardState extends State<ReminderCard> {
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: s.hHelper(1),
      ),
      height: s.hHelper(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: greyShadow,
            blurRadius: 12,
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 20,
            top: 5,
            bottom: 5,
            child: SvgPicture.asset(
              boxpattern,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: s.hHelper(2),
              ),
              Icon(
                CupertinoIcons.clock,
                size: 36,
              ),
              SizedBox(
                width: s.hHelper(3),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.crop,
                    style: smallerTextBold,
                  ),
                  Text(
                    widget.time,
                    style: smallerTextBold,
                  ),
                  Text(
                    widget.days,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff399F0B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
