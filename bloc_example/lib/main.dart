import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/blocs/counter_bloc.dart';
import 'tabs/counter_with_buttons.dart';
import 'tabs/counter_with_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Ejemplo de Flutter BLoC"),
            bottom: TabBar(
              tabs: <Widget>[
                Text('Con botones'),
                Text('Con slider'),
              ],
            ),
          ),
          body: BlocProvider(
            bloc: CounterBloc(),
            child: TabBarView(
              children: <Widget>[
                CounterWithButtons(),
                CounterWithSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
