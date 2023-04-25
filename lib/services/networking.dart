import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.lat, this.lon, this.apiKey);

  double lat;
  double lon;
  String apiKey;

  Future getData() async {
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': this.lat.toString(),
      'lon': this.lon.toString(),
      'appid': this.apiKey
    });
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}
