import 'package:flutter/material.dart';
import 'package:clima_master/screens/location_screen.dart';
import 'package:clima_master/services/location.dart';
import 'package:clima_master/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final String apiKey = 'b6155019a5d41cc93a9f42cd0be8bc01';

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    print(location.Latitude);
    print(location.Longitude);

    NetworkHelper networkHelper =
        NetworkHelper(location.Latitude, location.Longitude, apiKey);

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
