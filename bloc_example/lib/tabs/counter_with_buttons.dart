import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/blocs/counter_bloc.dart';

class CounterWithButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (context, counter) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'El valor del contador es:',
              ),
              Text(
                '$counter',
                style: Theme.of(context).textTheme.display1,
              ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _counterBloc.isDecrementerEnable
                        ? () {
                            _counterBloc.dispatch(
                              CounterState(action: CounterActions.decrement),
                            );
                          }
                        : null,
                    child: Text('-1'),
                    color: Colors.blueAccent,
                  ),
                  SizedBox(width: 30),
                  RaisedButton(
                    onPressed: _counterBloc.isIncrementerEnable
                        ? () {
                            _counterBloc.dispatch(
                              CounterState(action: CounterActions.increment),
                            );
                          }
                        : null,
                    child: Text('+1'),
                    color: Colors.blueAccent,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
