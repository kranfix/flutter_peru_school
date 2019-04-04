import 'package:flutter/material.dart';
import 'src/key_explorer_tiles.dart';
import 'src/dismissible_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Key explorer',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Key explorer'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            tabs: <Widget>[
              Text('Stateless'),
              Text('Stateful sin key'),
              Text('Stateful con key'),
              Text(
                'Dismissible List',
                style: TextStyle(fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            KeyExplorerTiles(
              doc: Text('Los Stateless Widgets no necesitan key.'),
              type: TileStateType.stateless,
            ),
            KeyExplorerTiles(
              doc: Text(
                  'Los Stateful Widgets sin key pueden presentar problemas.'),
              type: TileStateType.stateful_without_key,
            ),
            KeyExplorerTiles(
              doc:
                  Text('Los Stateful Widgets con key solucionan el problemas.'),
              type: TileStateType.stateful_with_key,
            ),
            DismissibleList(
              items: ['Español', 'Inglés', 'Ruso', 'Chino', 'Noruego'],
            ),
          ],
        ),
      ),
    );
  }
}
