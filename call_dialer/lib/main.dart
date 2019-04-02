import 'package:flutter/material.dart';
import 'example1.dart';
import 'example2.dart';
import 'example3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Call Dialer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final tabsController = TabController(length: 3);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget>[
              Text('A'),
              Text('B'),
              Text('C'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Example1(),
            Example2(),
            Example3(),
          ],
        ),
      ),
    );
  }
}

class TapBar {}
