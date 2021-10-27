// Pacakges
import 'package:flutter/material.dart';

// Services
import '../../services/data_service.dart';

// Widgets
import './widgets/make_request_button.dart';
import './widgets/response_data.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final _dataService = DataService();

  String? _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Builder(
              builder: (_) {
                return _response != null
                    ? ResponseData(_response.toString())
                    : MakeRequestButton(_makeRequest);
              },
            ),
          ),
        ),
      ),
    );
  }

  void _makeRequest() async {
    final String response = await _dataService.makeRequestToAPI();
    setState(() => _response = response);
  }
}
