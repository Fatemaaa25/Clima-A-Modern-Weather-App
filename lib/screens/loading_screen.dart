import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  void getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      print('Permission denied');
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      print('Permission permanently denied');
      await Geolocator.openAppSettings();
      return;
    }

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.low,
      distanceFilter: 100,
    );
    Position position =await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
