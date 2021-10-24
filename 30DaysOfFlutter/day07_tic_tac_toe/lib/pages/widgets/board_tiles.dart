// Packages
import 'package:flutter/material.dart';

// Widgets
import 'board_tile.dart';

// Data
import '../../data/tile_state.dart';

class BoardTiles extends StatelessWidget {
  final List<TileState> boardState;

  const BoardTiles({
    Key? key,
    required this.boardState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        final boardDimension = MediaQuery.of(context).size.width;
        final tileDimension = boardDimension / 3;

        return SizedBox(
          width: boardDimension,
          height: boardDimension,
          child: Column(
            children: [
              Row(
                children: [
                  BoardTile(tileDimension: tileDimension, onPressed: () {}),
                  BoardTile(tileDimension: tileDimension, onPressed: () {}),
                  BoardTile(tileDimension: tileDimension, onPressed: () {}),
                ],
              ),
              Row(
                children: [
                  BoardTile(tileDimension: tileDimension, onPressed: () {}),
                  BoardTile(tileDimension: tileDimension, onPressed: () {}),
                  BoardTile(tileDimension: tileDimension, onPressed: () {}),
                ],
              ),
              Row(
                children: [
                  BoardTile(tileDimension: tileDimension, onPressed: () {}),
                  BoardTile(tileDimension: tileDimension, onPressed: () {}),
                  BoardTile(tileDimension: tileDimension, onPressed: () {}),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
