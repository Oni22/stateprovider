import 'dart:async';

class StateModel<T> {

  final _stateController = StreamController<T>();
  Stream<T> get state => _stateController.stream;
  StreamSink<T> get notify => _stateController.sink;

  void initState(T model) {
    _stateController.add(model);
  }

  void dispose(){
    _stateController.close();
  }

}