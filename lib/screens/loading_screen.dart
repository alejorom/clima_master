import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clima_master/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
      Location location = Location();
      await location.getCurrentLocation();

      print (location.Latitude);
      print (location.Longitude);
  }

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getData() async
  {
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      "lat": "35",
      "lon": "139",
      "appid": "3f174b0c82263e31ce9b4523b146ed43"
    });
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    }
    else {

    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
