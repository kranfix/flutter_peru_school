import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SwapiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final person = SwapiPerson(
      name: "Frank",
      height: "175",
      mass: "74",
      gender: "Masculino",
    );
    return FutureBuilder(
      future: http.get('https://swapi.co/api/people/1/?format=json'),
      builder: (context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.hasData) {
          final Map<String, dynamic> data = jsonDecode(snapshot.data.body);
          return SwapiPersonCard(person: SwapiPerson.fromJson(data));
        } else if (snapshot.hasError) {
          return Text('Ups! Hubo error!');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class SwapiPersonCard extends StatelessWidget {
  final SwapiPerson person;
  SwapiPersonCard({this.person}) : assert(person != null);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 30.0);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 50,
      ),
      child: Card(
        color: Colors.pink[50],
        elevation: 5.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nombre: ${person.name}', style: textStyle),
            Text('Altura: ${person.height}', style: textStyle),
            Text('Masa: ${person.mass}', style: textStyle),
            Text('Genero: ${person.gender}', style: textStyle),
          ],
        ),
      ),
    );
  }
}

class SwapiPerson {
  final String name;
  final String height;
  final String mass;
  final String gender;

  SwapiPerson({
    @required this.name,
    @required this.height,
    @required this.mass,
    @required this.gender,
  });

  factory SwapiPerson.fromJson(Map<String, dynamic> json) {
    return SwapiPerson(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      gender: json['gender'],
    );
  }
}
