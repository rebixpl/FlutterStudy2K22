// Packages
import 'package:flutter/material.dart';

// Data
import '../../data/tile_state.dart';

class BoardTile extends StatelessWidget {
  final double tileDimension;
  final VoidCallback onPressed;
  final TileState tileState;

  const BoardTile({
    Key? key,
    required this.tileDimension,
    required this.onPressed,
    required this.tileState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tileDimension,
      width: tileDimension,
      child: MaterialButton(
        onPressed: onPressed,
        child: _getImageFromTileState(),
      ),
    );
  }

  Widget _getImageFromTileState() {
    switch (tileState) {
      case TileState.CIRCLE:
        return Image.asset('images/o.png');
      case TileState.CROSS:
        return Image.asset('images/x.png');
      case TileState.EMPTY:
        return Container();
      default:
        return Container();
    }
  }
}
