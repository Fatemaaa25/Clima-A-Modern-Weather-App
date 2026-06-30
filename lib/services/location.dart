import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
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

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      latitude=position.latitude;
      longitude=position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
