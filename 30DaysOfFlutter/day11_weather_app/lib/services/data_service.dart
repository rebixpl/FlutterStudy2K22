// Packages
import 'dart:convert';

import 'package:http/http.dart' as http;

// Models
import '../models/models.dart';

class DataService {
  Future<WeatherResponse> getCityWeather(String cityName) async {
    const String apiKey = "abaa7568114f6cbed939a87a2d3fb859";
    const String units = "metric";
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    // ----------------------- zzz1
    final queryParameters = {
      "q": cityName,
      "appid": apiKey,
      "units": units,
    };

    // ----------------------- zzz2
    final uri = Uri.https(
      "api.openweathermap.org",
      "/data/2.5/weather",
      queryParameters,
    );

    // ----------------------- zzz3
    final response = await http.get(uri);
    print('Response status: ${response.statusCode}');

    // ---------------------- zzz5
    final json = jsonDecode(response.body);

    // ---------------------- zzz6
    return WeatherResponse.fromJson(json);
  }
}
