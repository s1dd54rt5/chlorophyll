import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:chlorophyll/constants/theme.dart';

class Fertiliser extends StatefulWidget {
  @override
  _FertiliserState createState() => _FertiliserState();
}

class _FertiliserState extends State<Fertiliser> {
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
                "Fertiliser",
                style: bigTextBold,
              ),
              SizedBox(
                height: s.hHelper(4),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: greyShadow,
                      blurRadius: 20,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: s.wHelper(5),
                    vertical: s.hHelper(2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ammonium Phospate",
                        style: bigTextLight,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: s.hHelper(1.5),
                        ),
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            "18 grams",
                            style: bigTextLight,
                          ),
                          Spacer(),
                          Text(
                            "NO2",
                            style: bigTextLight,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: s.hHelper(1.5),
                        ),
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            "18 grams",
                            style: bigTextLight,
                          ),
                          Spacer(),
                          Text(
                            "NO2",
                            style: bigTextLight,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: s.hHelper(1.5),
                        ),
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            "18 grams",
                            style: bigTextLight,
                          ),
                          Spacer(),
                          Text(
                            "NO2",
                            style: bigTextLight,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: s.hHelper(1.5),
                        ),
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            "18 grams",
                            style: bigTextLight,
                          ),
                          Spacer(),
                          Text(
                            "NO2",
                            style: bigTextLight,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: s.hHelper(4),
              ),
              CustomButton(
                title: "Get fertiliser recommendation",
                onButtonPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
