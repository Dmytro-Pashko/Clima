import 'package:http/http.dart' as http;

const String apiKey = '5ac5f9146e1788814d05fa3f179a3864';

class NetworkService {
  Future<String> getWeatherData(double latitude, double longitude) async {
    var url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {'lat': latitude.toString(), 'lon': longitude.toString(), 'appid': apiKey},
    );
    print('Stared loading whether data from $url');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('Successfully loaded whether data: ${response.body}');
    }
    return response.body;
  }
}
