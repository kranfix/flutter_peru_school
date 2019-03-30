import 'package:flutter/material.dart';
import 'digit_button.dart';
import 'package:url_launcher/url_launcher.dart';

class NumPad extends StatefulWidget {
  @override
  _NumPadState createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
        ),
        Table(
          children: [
            TableRow(
              //children: [
              //  DigitButton(onPressed: () {}, text: '1'),
              //  DigitButton(onPressed: () {}, text: '2'),
              //  DigitButton(onPressed: () {}, text: '3')
              //],
              children: ['1', '2', '3'].map(digitToButton).toList(),
            ),
            TableRow(children: ['4', '5', '6'].map(digitToButton).toList()),
            TableRow(children: ['7', '8', '9'].map(digitToButton).toList()),
            TableRow(children: ['*', '0', '#'].map(digitToButton).toList()),
          ],
        ),
        FloatingActionButton(
          onPressed: () async {
            final url = 'tel:${controller.text}';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              showDialog(
                builder: (ctx) => Text("Fallo :'("),
                context: context,
              );
            }
          },
          child: Icon(Icons.phone),
        ),
      ],
    );
  }

  DigitButton digitToButton(String digit) {
    return DigitButton(
      text: digit,
      onPressed: () {
        controller.text = controller.text + digit;
      },
    );
  }
}
