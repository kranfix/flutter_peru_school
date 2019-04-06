import 'package:flutter/material.dart';
import '../widgets/login/inputWidget.dart';
import '../widgets/login/background.dart';
import '../widgets/buttons/raised_gradient_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.4),
            Column(
              children: <Widget>[
                ///holds email header and inputField
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 40, bottom: 10),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF999A9A),
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        InputWidget(30.0, 0.0),
                        Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Text(
                                    'Ingresa tu email para continuar...',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Color(0xFFA0A0A0),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              RaisedGradientButton(
                                width: 60,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                gradient: signInGradients,
                                onTab: () {
                                  print('flechit');
                                },
                                shape: CircleBorder(),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                roundedButton("Iniciemos", signInGradients, () {
                  print('H1');
                }),
                SizedBox(height: 10),
                roundedButton("Crea una cuenta", signUpGradients, () {
                  Navigator.popAndPushNamed(context, '/signUp');
                }),
              ],
            )
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
