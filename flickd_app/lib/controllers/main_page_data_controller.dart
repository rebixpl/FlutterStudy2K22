// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

// Services
import '../services/movie_service.dart';

// Models
import '../models/search_category.dart';
import '../models/main_page_data.dart';
import '../models/movie.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.initial()) {
    getMovies();
  }

  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      List<Movie> _movies = [];

      if (state.searchText.isEmpty) {
        if (state.searchCategory == SearchCategory.popular) {
          _movies = await _movieService.getPopularMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.upcoming) {
          _movies = await _movieService.getUpcomingMovies(page: state.page);
        } else if (state.searchCategory == SearchCategory.none) {
          _movies = [];
        }
      } else {
        // Perform text search
      }

      state = state.copyWith(
        movies: [...state.movies, ..._movies],
        page: state.page + 1,
      );
    } catch (e) {
      throw Exception("getMovies ERROR: $e");
    }
  }

  void updateSearchCategory(String _category) {
    try {
      state = state.copyWith(
        movies: [],
        page: 1,
        searchCategory: _category,
        searchText: "",
      );
      getMovies();
    } catch (e) {
      debugPrint("updateSearchCategory ERROR: $e");
      throw Exception(e);
    }
  }
}
