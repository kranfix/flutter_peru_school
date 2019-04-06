// Code from Stackoverflow:
// https://stackoverflow.com/questions/52243364/flutter-how-to-make-a-raised-button-that-has-a-gradient-background

import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final List<Color> gradient;
  final double width;
  final double height;
  final GestureTapCallback onTab;
  final ShapeBorder shape;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onTab,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        shape: shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        gradient: LinearGradient(colors: gradient),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(onTap: onTab, child: Center(child: child)),
      ),
    );
  }
}
