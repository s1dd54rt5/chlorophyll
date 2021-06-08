import 'dart:convert';

import 'package:chlorophyll/api/crop.dart';
import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/prefs.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/screens/landingScreen.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File _image;
  bool isLoading = false;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Scaffold(
      body: SingleChildScrollView(
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
                  GestureDetector(
                    onTap: getImage,
                    child: _image == null
                        ? Container(
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
                          )
                        : Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: ClipRRect(
                              child: Image.file(_image),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: s.hHelper(4),
                  ),
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(primaryGreen),
                          ),
                        )
                      : CustomButton(
                          title: "Analyse",
                          onButtonPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            Map result = await uploadImage(_image);
                            var prefs = await getHelper();
                            if (prefs.containsKey("remedies")) {
                              List remedies =
                                  jsonDecode(prefs.getString("remedies"));
                              remedies.add(result);
                              prefs.setString("remedies", jsonEncode(remedies));
                            } else {
                              List remedies = [];
                              remedies.add(result);
                              prefs.setString("remedies", jsonEncode(remedies));
                            }
                            setState(() {
                              isLoading = false;
                            });
                            Get.to(() => LandingScreen(index: 1));
                          },
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
