// Packages
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

// Services
import '../services/http_service.dart';

// Models
import '../models/movie.dart';

class MovieService {
  final getIt = GetIt.instance;
  late HTTPService _http;

  MovieService() {
    _http = getIt.get<HTTPService>();
  }

  Future<List<Movie>> getPopularMovies({required int page}) async {
    Response _response = await _http.get('/movie/popular', query: {
      'page': page,
    });
    if (_response.statusCode == 200) {
      // request was successful
      Map _data = _response.data;
      List<Movie> _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception('ERROR: Couldn\'t load popular movies.');
    }
  }

  Future<List<Movie>> getUpcomingMovies({required int page}) async {
    Response _response = await _http.get('/movie/upcoming', query: {
      'page': page,
    });
    if (_response.statusCode == 200) {
      // request was successful
      Map _data = _response.data;
      List<Movie> _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception('ERROR: Couldn\'t load upcoming movies.');
    }
  }

  Future<List<Movie>> searchMovies(
    String _searchTerm, {
    required int page,
  }) async {
    Response _response = await _http.get('/search/movie', query: {
      'query': _searchTerm,
      'page': page,
    });
    if (_response.statusCode == 200) {
      // request was successful
      Map _data = _response.data;
      List<Movie> _movies;

      _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();

      return _movies;
    } else {
      throw Exception('ERROR: Couldn\'t perform movies search.');
    }
  }
}
