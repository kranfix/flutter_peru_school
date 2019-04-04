import 'package:flutter/material.dart';

class DismissibleList extends StatefulWidget {
  DismissibleList({this.items}) : assert(items != null);
  final List<String> items;

  @override
  _DismissibleListState createState() => _DismissibleListState();
}

class _DismissibleListState extends State<DismissibleList> {
  List<String> items;

  @override
  void initState() {
    items = widget.items.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(items[index]),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });

            // Show a snackbar! This snackbar could also contain "Undo" actions.
            Scaffold.of(context).showSnackBar(
              SnackBar(
                  content: Text("${items[index]} dismissed to $direction")),
            );
          },
          background: Container(color: Colors.blue),
          child: ListTile(title: Text('${items[index]}')),
        );
      },
    );
  }
}
