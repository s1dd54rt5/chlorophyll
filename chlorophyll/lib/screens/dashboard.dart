import 'package:chlorophyll/constants/svgConst.dart';
import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: smallTextBold,
                      ),
                      Text(
                        "Siddharth",
                        style: bigTextBold,
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      CupertinoIcons.profile_circled,
                      size: 36,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: s.hHelper(4),
              ),
              Text(
                "Sunny, Clear",
                style: smallTextBold,
              ),
              SizedBox(
                height: s.hHelper(1),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: SvgPicture.asset(
                      sun,
                    ),
                  ),
                  SizedBox(
                    width: s.wHelper(2),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "25° Celcius",
                        style: smallTextLight,
                      ),
                      Text(
                        "Humidity 27%",
                        style: smallTextLight,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: s.hHelper(8),
              ),
              Text(
                "Your past searches",
                style: smallerTextBold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
