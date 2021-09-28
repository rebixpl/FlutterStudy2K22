// Packages
import 'package:get_it/get_it.dart';

// Services
import '../services/http_service.dart';

class MovieService {
  final getIt = GetIt.instance;
  late HTTPService _http;

  MovieService() {
    _http = getIt.get<HTTPService>();
  }
}
