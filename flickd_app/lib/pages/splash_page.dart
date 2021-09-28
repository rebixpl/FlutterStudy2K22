import 'dart:convert';

// Packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

// Services
import '../services/http_service.dart';

// Model
import '../models/app_config.dart';

class SplashPage extends StatefulWidget {
  // Function that is going to be passed to SplashPage and called once all of initialization is complete
  final VoidCallback onInitializationComplete;

  const SplashPage({
    Key? key,
    required this.onInitializationComplete,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
    ).then(
      (_) => _setup(context).then(
        (_) => widget.onInitializationComplete(),
      ),
    );
  }

  Future<void> _setup(BuildContext _context) async {
    final GetIt getIt = GetIt.instance;

    final String configFile =
        await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    // Singleton (just one instance of a class that is globally accessible and the same everywhere)
    getIt.registerSingleton<AppConfig>(
      AppConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY'],
      ),
    );

    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flickd",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
