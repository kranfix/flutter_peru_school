import 'package:flutter/material.dart';

List<Icon> myIcons = [
  Icon(Icons.phone),
  Icon(Icons.star),
  Icon(Icons.mail),
  Icon(Icons.credit_card),
  Icon(Icons.stop)
];

class Example3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i) => myIcons[i % 5],
    );
  }
}
