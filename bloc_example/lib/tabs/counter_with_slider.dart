import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/blocs/counter_bloc.dart';

class CounterWithSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (context, int counter) {
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
              Slider(
                min: _counterBloc.min.toDouble(),
                max: _counterBloc.max.toDouble(),
                value: counter.toDouble(),
                divisions: 10,
                onChanged: (newValue) {
                  _counterBloc.dispatch(
                    CounterEvent(
                      action: CounterActions.preset,
                      value: newValue.toInt(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
