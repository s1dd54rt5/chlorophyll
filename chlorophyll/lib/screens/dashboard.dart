import 'dart:convert';
import 'package:chlorophyll/api/weather.dart';
import 'package:chlorophyll/constants/theme.dart';
import 'package:chlorophyll/helpers/prefs.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:chlorophyll/screens/profile.dart';
import 'package:chlorophyll/screens/upload.dart';
import 'package:chlorophyll/widgets/button.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void initState() {
    getDetails();
    super.initState();
  }

  bool isLoading = false;

  List remedies = [];

  Map<String, dynamic> userDetails = {};

  Map<String, dynamic> weatherDetails = {};

  Weather w = new Weather();

  Future<void> getLocation() async {
    setState(() {
      isLoading = true;
    });
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    weatherDetails = await w.getWeatherDetails(
        _locationData.latitude.toString(), _locationData.longitude.toString());
    setState(() {
      isLoading = false;
    });
  }

  DateTime sunset;
  DateTime sunrise;

  String getTime(DateTime date) {
    return DateFormat("h:mma").format(date).toString();
  }

  Future<void> getDetails() async {
    setState(() {
      isLoading = true;
    });
    var prefs = await getHelper();
    var json = prefs.getString("userDetails");
    userDetails = jsonDecode(json);
    if (prefs.containsKey("remedies")) {
      remedies = jsonDecode(prefs.getString("remedies"));
    }
    await getLocation();
    sunrise = DateTime.fromMillisecondsSinceEpoch(
        weatherDetails["sys"]["sunrise"] * 1000);
    sunset = DateTime.fromMillisecondsSinceEpoch(
        weatherDetails["sys"]["sunset"] * 1000);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(primaryGreen),
            ),
          )
        : SingleChildScrollView(
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
                                userDetails["first_name"],
                                style: bigTextBold,
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => Profile());
                            },
                            child: Icon(
                              CupertinoIcons.profile_circled,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: s.hHelper(2),
                      ),
                      Text(
                        "Today in " + weatherDetails["name"] + "!",
                        style: smallTextBold,
                      ),
                      SizedBox(
                        height: s.hHelper(2),
                      ),
                      Text(
                        weatherDetails["weather"][0]["main"],
                        style: smallerTextBold,
                      ),
                      SizedBox(
                        height: s.hHelper(0.5),
                      ),
                      Text(
                        weatherDetails["weather"][0]["description"],
                        style: smallTextLight,
                      ),
                      SizedBox(
                        width: s.wHelper(2),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weatherDetails["main"]["temp"]
                                    .toString()
                                    .substring(0, 2) +
                                "° Celcius",
                            style: smallTextLight,
                          ),
                          Text(
                            "Humidity " +
                                weatherDetails["main"]["temp"].toString() +
                                "%",
                            style: smallTextLight,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: s.hHelper(0.5),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(CupertinoIcons.sunrise),
                          SizedBox(
                            width: s.wHelper(1),
                          ),
                          Text(
                            getTime(sunrise),
                            style: smallTextLight,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: s.hHelper(0.5),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(CupertinoIcons.sunset),
                          SizedBox(
                            width: s.wHelper(1),
                          ),
                          Text(
                            getTime(sunset),
                            style: smallTextLight,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: s.hHelper(4),
                      ),
                      Text(
                        "Your past searches",
                        style: smallerTextBold,
                      ),
                      SizedBox(
                        height: s.hHelper(2),
                      ),
                      remedies.length == 0
                          ? Container(
                              height: s.hHelper(15),
                              width: double.infinity,
                              decoration: DottedDecoration(
                                dash: [10, 15],
                                shape: Shape.box,
                                borderRadius: BorderRadius.circular(20),
                                color: primaryGreen,
                                strokeWidth: 2.5,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "No searches yet",
                                style: smallTextLight,
                              ),
                            )
                          : Column(
                              children: [
                                for (var remedy in remedies)
                                  Container(
                                    width: double.infinity,
                                    decoration: DottedDecoration(
                                      dash: [10, 15],
                                      shape: Shape.box,
                                      borderRadius: BorderRadius.circular(20),
                                      color: primaryGreen,
                                      strokeWidth: 2.5,
                                    ),
                                    padding: EdgeInsets.all(s.wHelper(4)),
                                    margin:
                                        EdgeInsets.only(bottom: s.hHelper(1)),
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          remedy["name"],
                                          style: smallerTextBold,
                                        ),
                                        SizedBox(
                                          height: s.hHelper(1),
                                        ),
                                        Text(
                                          remedy["remedy"],
                                          style: smallTextLight,
                                        ),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                      SizedBox(
                        height: s.hHelper(4),
                      ),
                      CustomButton(
                        title: "Start analysis",
                        onButtonPressed: () {
                          Get.to(() => Upload());
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
