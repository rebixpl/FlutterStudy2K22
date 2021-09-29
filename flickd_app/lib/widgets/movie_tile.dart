// Packages
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// Models
import '../models/movie.dart';

class MovieTile extends StatelessWidget {
  final getIt = GetIt.instance;

  final double height;
  final double width;
  final Movie movie;

  MovieTile({
    Key? key,
    required this.height,
    required this.width,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _moviePosterWidget(movie.posterURL()),
        ],
      ),
    );
  }

  Widget _moviePosterWidget(String _imageUrl) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imageUrl),
        ),
      ),
    );
  }
}
