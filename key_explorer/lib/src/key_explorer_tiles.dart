import 'package:flutter/material.dart';
import 'colorful_tiles.dart';

enum TileStateType { stateless, stateful_with_key, stateful_without_key }

class KeyExplorerTiles extends StatefulWidget {
  KeyExplorerTiles({
    Key key,
    @required this.doc,
    @required this.type,
  })  : assert(doc != null),
        assert(type != null),
        super(key: key);
  final Widget doc;
  final TileStateType type;

  @override
  _KeyExplorerTilesState createState() => _KeyExplorerTilesState();
}

class _KeyExplorerTilesState extends State<KeyExplorerTiles> {
  List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = ['1', '2', '3'].map((text) {
      switch (widget.type) {
        case TileStateType.stateless:
          return StatelessColorfulTile(text: text);
          break;
        case TileStateType.stateful_without_key:
          return StatefulColorfulTile(text: text);
          break;
        case TileStateType.stateful_with_key:
          return StatefulColorfulTile(text: text, key: UniqueKey());
          break;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          widget.doc,
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: tiles),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Icon(Icons.arrow_left, color: Colors.white),
                onPressed: shiftTilesToLeft,
                color: Colors.purple[400],
              ),
              SizedBox(width: 5.0),
              FlatButton(
                child: Icon(Icons.arrow_right, color: Colors.white),
                onPressed: shiftTilesToRight,
                color: Colors.purple[400],
              ),
            ],
          ),
        ],
      ),
    );
  }

  shiftTilesToLeft() {
    setState(() {
      final temporal = tiles[0];
      for (int i = 1; i < tiles.length; i++) {
        tiles[i - 1] = tiles[i];
      }
      tiles[tiles.length - 1] = temporal;
    });
  }

  shiftTilesToRight() {
    setState(() {
      final temporal = tiles[tiles.length - 1];
      for (int i = tiles.length - 1; i > 0; i--) {
        tiles[i] = tiles[i - 1];
      }
      tiles[0] = temporal;
    });
  }
}
