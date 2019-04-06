import 'package:flutter/material.dart';
import './utils.dart';

class StatelessColorfulTile extends StatelessWidget {
  StatelessColorfulTile({String text})
      : _color = randomColor(),
        text = text ?? '( )';
  final Color _color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      padding: EdgeInsets.all(50.0),
      child: Text(text),
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({Key key, this.text}) : super(key: key);

  final String text;

  @override
  _StatefulColorfulTileState createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color color;

  @override
  void initState() {
    super.initState();
    color = randomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.all(50.0),
      child: Text(widget.text),
    );
  }
}
