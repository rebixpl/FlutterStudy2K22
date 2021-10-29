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
  final int responseStatus;

  String get iconUrl {
    return cityName != "Wadowice"
        ? "https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png"
        : "https://piekarniagrzybki.pl/wp-content/uploads/2017/12/kremowka.jpg";
  }

  WeatherResponse({
    required this.cityName,
    required this.temperatureInfo,
    required this.weatherInfo,
    required this.responseStatus,
  });

  //------------------- zzz4
  factory WeatherResponse.fromJson(
    Map<String, dynamic> json, {
    required int responseStatus,
  }) {
    final cityName = json["name"];
    final temperatureInfo = TemperatureInfo.fromJson(json["main"]);
    final weatherInfo = WeatherInfo.fromJson(json["weather"][0]);

    return WeatherResponse(
      cityName: cityName as String,
      temperatureInfo: temperatureInfo,
      weatherInfo: weatherInfo,
      responseStatus: responseStatus,
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
