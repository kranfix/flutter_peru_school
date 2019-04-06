import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final double topRight;
  final double bottomRight;
  final String hintText;

  InputWidget(this.topRight, this.bottomRight, {this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 40),
      width: MediaQuery.of(context).size.width - 40,
      child: Material(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 20),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText ?? "dash.dart@flutter.pe",
              hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
