import 'package:bloc/bloc.dart';

enum CounterActions { increment, decrement, preset }

class CounterEvent {
  final CounterActions action;
  final int value;
  CounterEvent({this.action, this.value});
}

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  int min = 0;
  int max = 10;

  bool get isIncrementerEnable => currentState < max;
  bool get isDecrementerEnable => currentState > min;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event.action) {
      case CounterActions.increment:
        if (isIncrementerEnable) {
          yield currentState + 1;
        }
        break;
      case CounterActions.decrement:
        if (isDecrementerEnable) {
          yield currentState - 1;
        }
        break;
      case CounterActions.preset:
        yield event.value;
        break;
    }
  }
}
