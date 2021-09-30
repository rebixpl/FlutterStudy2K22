// Models
import '../models/movie.dart';
import './search_category.dart';

class MainPageData {
  final List<Movie> movies;
  final int page;
  final String searchCategory;
  final String searchText;

  // Main constructor
  MainPageData({
    required this.movies,
    required this.page,
    required this.searchCategory,
    required this.searchText,
  });

  // Alternative Constructor with basic data
  MainPageData.initial()
      : movies = [],
        page = 1,
        searchCategory = SearchCategory.popular,
        searchText = '';

  // This function allows us to change some data in the class without changing other data
  MainPageData copyWith(
    List<Movie>? movies,
    int? page,
    String? searchCategory,
    String? searchText,
  ) {
    return MainPageData(
      movies: movies ?? this.movies,
      page: page ?? this.page,
      searchCategory: searchCategory ?? this.searchCategory,
      searchText: searchText ?? this.searchText,
    );
  }
}
