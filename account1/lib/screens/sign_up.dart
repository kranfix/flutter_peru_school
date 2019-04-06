import 'package:flutter/material.dart';
import '../widgets/login/inputWidget.dart';
import '../widgets/login/background.dart';
import '../widgets/buttons/raised_gradient_button.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.4),
            InputWidget(30.0, 0.0),
            SizedBox(height: 15),
            InputWidget(0.0, 30.0),
            SizedBox(height: 15),
            InputWidget(30.0, 0.0),
            SizedBox(height: 15),
            InputWidget(0.0, 30.0),
            SizedBox(height: 15),
            roundedButton("Crea una cuenta", signUpGradients, () {
              Navigator.popAndPushNamed(context, '/signUp');
            }),
            SizedBox(height: 10),
            RaisedGradientButton(
              width: 60,
              child: Icon(
                Icons.arrow_back,
                size: 40,
                color: Colors.white,
              ),
              gradient: signInGradients,
              onTab: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              shape: CircleBorder(),
            ),
          ],
        ),
      ],
    );
  }
}

Widget roundedButton(
    String title, List<Color> gradient, GestureTapCallback onTab) {
  return Builder(builder: (BuildContext ctx) {
    return RaisedGradientButton(
      width: MediaQuery.of(ctx).size.width / 1.8,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      gradient: gradient,
      onTab: onTab,
    );
  });
}

const List<Color> signInGradients = [Color(0xFF0EDED2), Color(0xFF03A0FE)];
const List<Color> signUpGradients = [Color(0xFFFF9945), Color(0xFFFc6076)];
