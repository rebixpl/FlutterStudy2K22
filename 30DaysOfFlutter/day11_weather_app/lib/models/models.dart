/*
{
  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
  },
  "name": "Mountain View",
  }                
*/

class WeatherResponse {
  final String cityName;
  final TemperatureInfo temperatureInfo;
  final WeatherInfo weatherInfo;

  WeatherResponse({
    required this.cityName,
    required this.temperatureInfo,
    required this.weatherInfo,
  });

  //------------------- zzz4
  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json["name"];
    final temperatureInfo = TemperatureInfo.fromJson(json["main"]);
    final weatherInfo = WeatherInfo.fromJson(json["weather"][0]);

    return WeatherResponse(
      cityName: cityName as String,
      temperatureInfo: temperatureInfo,
      weatherInfo: weatherInfo,
    );
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json["temp"];
    return TemperatureInfo(temperature: temperature as double);
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({
    required this.description,
    required this.icon,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(
        description: description as String, icon: icon as String);
  }
}
