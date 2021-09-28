import 'package:flutter/material.dart';

import '../models/app_config.dart';

// Packages
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  late String _base_url;
  late String _api_key;

  // Constructor
  HTTPService() {
    AppConfig _config = getIt.get<AppConfig>();
    _base_url = _config.BASE_API_URL;
    _api_key = _config.API_KEY;
  }

  Future<Response> get(
    String _path, {
    required Map<String, dynamic> query,
  }) async {
    try {
      String _url = '$_base_url$_path';
      Map<String, dynamic> _query = {
        'api_key': _api_key,
        'language': 'en-US',
      };

      _query.addAll(query);

      return await dio.get(_url, queryParameters: _query);
    } on DioError catch (e) {
      debugPrint(
          'DioError: Unable to perform get request.'); // Use debugPrint because it'll only show data in debug mode and will not run in release mode
      // print('DioError:$e'); // Instead of printing error, throw exception
      throw Exception(e);
    }
  }
}
