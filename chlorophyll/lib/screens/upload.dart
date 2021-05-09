import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Scaffold(
      body: Stack(
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
                  "Upload",
                  style: bigTextBold,
                ),
                SizedBox(
                  height: s.hHelper(4),
                ),
                Container(
                  height: s.hHelper(40),
                  width: double.infinity,
                  decoration: DottedDecoration(
                    dash: [10, 15],
                    shape: Shape.box,
                    borderRadius: BorderRadius.circular(20),
                    color: primaryGreen,
                    strokeWidth: 2.5,
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.15,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: grey,
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Icon(
                          CupertinoIcons.camera,
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: s.hHelper(4),
                ),
                CustomButton(
                  title: "Analyse",
                  onButtonPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
