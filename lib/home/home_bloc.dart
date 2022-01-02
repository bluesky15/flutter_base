import 'dart:async';

enum HomeAction { increment, decrement, reset }

class HomeBloc {
  int counter = 0;
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink;

  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<HomeAction>();

  StreamSink<HomeAction> get eventSink => _eventStreamController.sink;

  Stream<HomeAction> get eventStream => _eventStreamController.stream;

  HomeBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == HomeAction.increment) {
        counter++;
      } else if (event == HomeAction.decrement) {
        counter--;
      } else if (event == HomeAction.reset) {
        counter = 0;
      }
      counterSink.add(counter);
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
