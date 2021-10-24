// Packages
import 'package:flutter/material.dart';

// Widgets
import 'board_tile.dart';

// Data
import '../../data/tile_state.dart';
import '../../data/global_variables.dart';

// Controllers
import '../../controllers/game_brain.dart';

class BoardTiles extends StatefulWidget {
  const BoardTiles({
    Key? key,
  }) : super(key: key);

  @override
  State<BoardTiles> createState() => _BoardTilesState();
}

class _BoardTilesState extends State<BoardTiles> {
  List<TileState> _boardState = List.filled(9, TileState.EMPTY);

  var _currentTurn = TileState.CROSS;

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
            children: chunk(_boardState, 3).asMap().entries.map(
              (entry) {
                final chunkIndex = entry.key;
                final List<TileState> tileStateChunk = entry.value;

                return Row(
                  children: tileStateChunk.asMap().entries.map((entry) {
                    final innerIndex = entry.key;
                    final tileState = entry.value;
                    final tileIndex = (chunkIndex * 3) + innerIndex;

                    return BoardTile(
                      tileDimension: tileDimension,
                      onPressed: () => _updateTileStateForIndex(tileIndex),
                      tileState: tileState,
                    );
                  }).toList(),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }

  void _updateTileStateForIndex(int selectedIndex) {
    if (_boardState[selectedIndex] == TileState.EMPTY) {
      setState(() {
        _boardState[selectedIndex] = _currentTurn;
      });

      _currentTurn =
          _currentTurn == TileState.CIRCLE ? TileState.CROSS : TileState.CIRCLE;

      final TileState winner = GameBrain.findWinner(boardState: _boardState);

      if (winner != TileState.WINNER_NOT_FOUND) {
        debugPrint("Winner is $winner");
        GameBrain.showWinnerDialog(
          winner,
          newGamePressed: () => setState(
            () {
              // Reset game
              _boardState = List.filled(9, TileState.EMPTY);
              _currentTurn = TileState.CROSS;
              Navigator.of(navigatorContext).pop();
            },
          ),
        );
      }
    }
  }
}
