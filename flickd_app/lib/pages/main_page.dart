import 'dart:ui';

// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Widgets
import '../widgets/movie_tile.dart';

// Models
import '../models/search_category.dart';
import '../models/movie.dart';

class MainPage extends ConsumerWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  late TextEditingController _searchTextFieldController;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _searchTextFieldController = TextEditingController();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundWidget(),
            _foregroundWidgets(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://www.getaway.co.za/wp-content/uploads/2020/05/Africa.jpg",
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  Widget _foregroundWidgets() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.02, 0, 0),
      width: _deviceHeight * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          Container(
            height: _deviceHeight * 0.83,
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight * 0.01,
            ),
            child: _moviesListViewWidget(),
          ),
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      height: _deviceHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchFieldWidget(),
          _categorySelectionWidget(),
        ],
      ),
    );
  }

  Widget _searchFieldWidget() {
    final _border = InputBorder.none;

    return SizedBox(
      width: _deviceWidth * 0.5,
      height: _deviceHeight * 0.05,
      child: TextField(
        controller: _searchTextFieldController,
        onSubmitted: (_input) {},
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            focusedBorder: _border,
            border: _border,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white24,
            ),
            hintStyle: const TextStyle(
              color: Colors.white54,
            ),
            filled: false,
            fillColor: Colors.white24,
            hintText: "Search...."),
      ),
    );
  }

  Widget _categorySelectionWidget() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: SearchCategory.popular,
      icon: const Icon(Icons.menu, color: Colors.white24),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (_value) {},
      items: const [
        DropdownMenuItem(
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.popular,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.upcoming,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.none,
        ),
      ],
    );
  }

  Widget _moviesListViewWidget() {
    final List<Movie> _movies = [];

    for (var i = 0; i < 20; i++) {
      _movies.add(
        Movie(
          name: "Mortal Kombat",
          language: "EN",
          isAdult: false,
          description:
              "Hunted by the fearsome warrior Sub-Zero, MMA fighter Cole Young finds sanctuary at the temple of Lord Raiden. Training with experienced fighters Liu Kang, Kung Lao and the rogue mercenary Kano, Cole prepares to stand with Earth's greatest champions to take on the enemies from Outworld in a high-stakes battle for the universe.",
          posterPath: "nkayOAUBUu4mMvyNf9iHSUiPjF1.jpg",
          backdropPath: "nkayOAUBUu4mMvyNf9iHSUiPjF1.jpg",
          rating: 7.8,
          releaseDate: "2021-04-07",
        ),
      );
    }

    if (_movies.isNotEmpty) {
      return ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int _count) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight * 0.01,
            ),
            child: GestureDetector(
              onTap: () {},
              child: MovieTile(
                height: _deviceHeight * 0.2,
                width: _deviceWidth * 0.85,
                movie: _movies[_count],
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.black87,
          strokeWidth: 3.0,
        ),
      );
    }
  }
}
