// Diseño inspirado en https://www.uplabs.com/posts/best-mobile-app-login-sign-up-concept
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'screens/login.dart';
import 'screens/sign_up.dart';
import 'screens/sin_wave.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //final FirebaseOptions options = const FirebaseOptions(
  //  googleAppID: 'flutterperu-1d0ac',
  //  apiKey: 'AIzaSyCKH9SlcxiReN1XSRnK_unblYO31WSL5EU',
  //  projectID: 'flutterperu-1d0ac',
  //);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
        '/signUp': (BuildContext context) => SignUpScreen(),
        '/sinWave': (BuildContext context) => SinWaveScreen(),
      },
    );
  }
}
