import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset(
                'assets/images/flutter_peru.jpg',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              WavyHeader(),
            ],
          ),
          Expanded(child: Container()),
          Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              WavyFooter(),
              BottomCircle(Offset(-70.0, 90.0), 120, Color(0xFFE92921)),
              BottomCircle(Offset(0.0, 210.0), 140, Color(0xFF3DE8D1)),
            ],
          )
        ],
      ),
    );
  }
}

const orangeGradients = <Color>[
  Color(0xFFFF9844),
  Color(0xFFFE8853),
  Color(0xFFFD7267),
];
const aquaGradients = <Color>[Color(0xFF5AEAF1), Color(0xFF8EF7DA)];
const flutterGradient = <Color>[Color(0xFF55C8FF), Color(0xFF0358A2)];

class WavyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: flutterGradient,
            begin: Alignment.center,
            end: Alignment.topLeft,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.35,
      ),
    );
  }
}

class WavyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: flutterGradient,
            begin: Alignment.center,
            end: Alignment.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height / 3,
      ),
    );
  }
}

class BottomCircle extends StatelessWidget {
  final Offset offset;
  final double radius;
  final Color color;
  BottomCircle(this.offset, this.radius, this.color);
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Material(
        color: color,
        child: Padding(padding: EdgeInsets.all(radius)),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 15.0)),
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    // Control Points and End Points
    final control1 = Offset(size.width / 6, size.height * 6 / 7);
    final end1 = Offset(size.width / 5, size.height * 3 / 5);

    final control2 = Offset(size.width * 0.25, size.height / 4);
    final end2 = Offset(size.width / 1.5, size.height / 5);

    final control3 = Offset(size.width * 8 / 9, size.height / 6);
    final end3 = Offset(size.width, 0.0);

    ///move from bottom right to top
    return Path()
      ..lineTo(0.0, size.height)
      ..quadraticBezierTo(control1.dx, control1.dy, end1.dx, end1.dy)
      ..quadraticBezierTo(control2.dx, control2.dy, end2.dx, end2.dy)
      ..quadraticBezierTo(control3.dx, control3.dy, end3.dx, end3.dy)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var control2 = Offset(size.width - (size.width / 6), size.height);
    var end2 = Offset(size.width, 0.0);

    return Path()
      ..moveTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..lineTo(0.0, size.height - 60)
      ..quadraticBezierTo(control2.dx, control2.dy, end2.dx, end2.dy);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
