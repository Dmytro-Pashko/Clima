import 'package:http/http.dart' as http;

const String apiKey = '';

/// Data model that represent network response.
class Response {
  final int responseCode;
  final String? data;

  Response(this.responseCode, this.data);

  bool isSuccess() {
    return responseCode == 200;
  }
}

/// Service that encapsulates all network related logic.
class NetworkService {
  Future<Response> getWeatherDataForLocation(
      double latitude, double longitude) async {
    var url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': apiKey,
        'units': 'metric',
      },
    );
    print('Stared loading whether data from $url');
    return await sendGetRequest(url);
  }

  Future<Response> getWeatherDataForCity(String city) async {
    var url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'q': city,
        'appid': apiKey,
        'units': 'metric',
      },
    );
    print('Stared loading whether data from $url');
    return await sendGetRequest(url);
  }

  Future<Response> sendGetRequest(Uri uri) async {
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        print('Successfully loaded whether data: ${response.body}');
      } else {
        print('Cannot load whether data: ${response.reasonPhrase}');
      }
      return Response(response.statusCode, response.body);
    } catch (error) {
      print('Cannot load whether data: $error');
      return Response(-1, null);
    }
  }
}
