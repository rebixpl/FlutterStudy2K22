// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Data
import '../data/tile_state.dart';
import '../data/global_variables.dart';

class GameBrain {
  /// Checks all combinations in the board to find the winner. Returns TileState with
  /// winner sign. If winner was not found returns TileState.WINNER_NOT_FOUND.
  static TileState findWinner({required List<TileState> boardState}) {
    TileState winner = TileState.WINNER_NOT_FOUND;

    /// Checks if 3 numbers (TileStates) are equal and not empty
    TileState winnerForMatch(a, b, c) {
      if (boardState[a] != TileState.EMPTY) {
        if ((boardState[a] == boardState[b]) &&
            (boardState[b] == boardState[c])) {
          return boardState[a];
        }
      }
      return TileState.WINNER_NOT_FOUND;
    }

    final checks = [
      winnerForMatch(0, 1, 2),
      winnerForMatch(3, 4, 5),
      winnerForMatch(6, 7, 8),
      winnerForMatch(0, 4, 8),
      winnerForMatch(2, 4, 6),
      winnerForMatch(0, 3, 6),
      winnerForMatch(1, 4, 7),
      winnerForMatch(2, 5, 8),
    ];

    for (TileState winnerCheck in checks) {
      if (winnerCheck != TileState.WINNER_NOT_FOUND) {
        // winner found
        winner = winnerCheck;
        break;
      }
    }

    return winner;
  }

  /// Shows popup with the information about a winner.
  static showWinnerDialog(TileState winnerTileState,
      {required Function() newGamePressed}) {
    showDialog(
      context: navigatorContext,
      builder: (_) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Winner",
              style: Theme.of(navigatorContext).textTheme.headline2,
            ),
          ),
          content: Image.asset(
            winnerTileState == TileState.CROSS
                ? "images/x.png"
                : "images/o.png",
            width: 300.0,
            height: 300.0,
          ),
          actions: [
            MaterialButton(
              onPressed: () => newGamePressed(),
              child: const Text(
                "New Game",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        );
      },
    );
  }
}
