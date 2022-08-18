import 'package:flutter/material.dart';
import 'package:farm_location/MVC/Views/map_view.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => LocationController();
}

class LocationController extends State<LocationScreen> {
  int counter = 4;
  String longitude = '';
  String latitude = '';
  List<Map<String, String>> points = [
    {"Longitude": '', "Latitude": ''},
    {"Longitude": '', "Latitude": ''},
    {"Longitude": '', "Latitude": ''},
    {"Longitude": '', "Latitude": ''},
  ];

  void incrementCounter() {
    setState(() {
      counter++;
    });
    points.add(
      {"Longitude": '', "Latitude": ''},
    );
  }

  void decrementCounter(int index) {
    setState(() {
      counter--;
    });
    points.removeAt(index);
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> updatePosition(int index) async {
    Position position = await determinePosition();
    points[index]['Longitude'] = position.longitude.toStringAsFixed(4);
    points[index]['Latitude'] = position.latitude.toStringAsFixed(4);
  }

  @override
  Widget build(BuildContext context) {
    return MapView(this);
  }
}
