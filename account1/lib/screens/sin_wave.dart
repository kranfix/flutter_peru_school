import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/buttons/raised_gradient_button.dart';

class SinWaveScreen extends StatefulWidget {
  final duration = Duration(milliseconds: 20);
  @override
  _SinWaveScreenState createState() => _SinWaveScreenState();
}

class _SinWaveScreenState extends State<SinWaveScreen> {
  double _percent = 0.0;
  Timer timer;

  double get phase => 2 * pi * _percent;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(widget.duration, (t) {
      setState(() {
        _percent += 0.02;
        if (_percent > 1.0) {
          _percent -= 1;
          print('Running');
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    print('Timer cancelado');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'Onda Sinusoidal',
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 60),
          child: RaisedGradientButton(
            onTab: () {
              Navigator.popAndPushNamed(context, '/login');
            },
            child: Text(
              'Regresar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            shape: StadiumBorder(),
            gradient: [Colors.blue, Colors.green],
          ),
        ),
        ClipPath(
          clipper: SinWaveClipper(phase: phase),
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
          ),
        ),
      ],
    );
  }
}

class SinWaveClipper extends CustomClipper<Path> {
  final double phase;
  SinWaveClipper({this.phase = 0.0});

  @override
  Path getClip(Size size) {
    const amp = 20.0;
    const n = 36;
    const frec = 2.5;
    final wave = List<Offset>.generate(n + 1, (i) {
      final w = 2 * pi * frec;
      final dx = i * size.width / n;
      final dy = amp + amp * sin(w * i / n + phase);
      return Offset(dx, dy);
    });

    return Path()
      ..addPolygon(wave, false)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(SinWaveClipper oldClipper) => oldClipper.phase != phase;
}
