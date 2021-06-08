import 'package:chlorophyll/api/soil.dart';
import 'package:chlorophyll/helpers/size.dart';
import 'package:flutter/material.dart';
import 'package:chlorophyll/constants/theme.dart';
import 'package:location/location.dart';

class Fertiliser extends StatefulWidget {
  @override
  _FertiliserState createState() => _FertiliserState();
}

class _FertiliserState extends State<Fertiliser> {
  void initState() {
    getDetails();
    super.initState();
  }

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

    soilDetails = await getSoilData(
        _locationData.latitude.toString(), _locationData.longitude.toString());
    waterDetails = await getWaterData(
        _locationData.latitude.toString(), _locationData.longitude.toString());
    print(waterDetails);
    setState(() {
      isLoading = false;
    });
  }

  Map soilDetails = {};
  Map waterDetails = {};

  Future<void> getDetails() async {
    setState(() {
      isLoading = true;
    });
    await getLocation();
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(primaryGreen),
            ),
          )
        : Stack(
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
                      "Soil",
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
                              "Location Details",
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
                                  "Soil Temperature",
                                  style: bigTextLight,
                                ),
                                Spacer(),
                                Text(
                                  soilDetails["data"][0]["soil_temperature"]
                                      .toString()
                                      .substring(0, 4),
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
                                  "Soil Moisture",
                                  style: bigTextLight,
                                ),
                                Spacer(),
                                Text(
                                  soilDetails["data"][0]["soil_moisture"]
                                      .toString(),
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
                                  "Water Vapor",
                                  style: bigTextLight,
                                ),
                                Spacer(),
                                Text(
                                  waterDetails["data"][0]["water_vapor"]
                                      .toString()
                                      .substring(0, 4),
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
                  ],
                ),
              ),
            ],
          );
  }
}
