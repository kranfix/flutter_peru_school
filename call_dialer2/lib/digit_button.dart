import 'package:flutter/material.dart';

class DigitButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  DigitButton({
    @required this.onPressed,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RawMaterialButton(
      onPressed: onPressed,
      child: Text(text),
      fillColor: Colors.white,
      elevation: 5.0,
      textStyle: theme.accentTextTheme.button.copyWith(
        color: Colors.blue[600],
        fontSize: 28.0,
      ),
      //shape: StadiumBorder(),
      shape: CircleBorder(),
    );
  }
}
