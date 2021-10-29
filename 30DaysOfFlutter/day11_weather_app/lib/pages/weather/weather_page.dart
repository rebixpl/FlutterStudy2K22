// Packages
import 'package:day11_weather_app/models/models.dart';
import 'package:flutter/material.dart';

// Services
import '../../services/data_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _weatherResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (_weatherResponse != null)
                ? Column(
                    children: [
                      Image.network(
                        _weatherResponse!.iconUrl,
                        width: 150.0,
                      ),
                      Text(
                        "${_weatherResponse!.temperatureInfo.temperature}",
                        style: const TextStyle(fontSize: 40.0),
                      ),
                      Text(_weatherResponse!.weatherInfo.description),
                    ],
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 58.0),
              child: SizedBox(
                width: 150.0,
                child: TextField(
                  controller: _cityTextController,
                  decoration: const InputDecoration(labelText: "City"),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _search,
              child: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }

  void _search() async {
    // ---------------------- zzz7
    final response =
        await _dataService.getCityWeather(_cityTextController.text);
    setState(() => _weatherResponse = response);
  }
}
