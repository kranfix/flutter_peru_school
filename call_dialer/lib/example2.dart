import 'package:flutter/material.dart';

int fibonacci(n) {
  if (n < 2) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

List<String> texts = [
  "Esos bastardos me engañaron",
  "La viaja confiable",
  "Adios Perro Vaca"
];

class Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return ListView(
    //  children: <Widget>[
    //    Text('Hola'),
    //    Text('Hello'),
    //    Text('Hallo'),
    //    Text('Bon jou'),
    //    Text('Ciao'),
    //  ],
    //);
    return ListView.builder(
      itemBuilder: (ctx, i) => Text(
            //fibonacci(i).toString(),
            texts[i % 3],
            style: TextStyle(fontSize: 25.0),
          ),
    );
  }
}
