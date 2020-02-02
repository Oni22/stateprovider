import 'dart:async';

class StateModel<T> {

  final _stateController = StreamController<T>();
  Stream<T> get state => _stateController.stream;

  void initState(T model) {
    _stateController.add(model);
  }
  void notify(T model) => _stateController.sink.add(model);

  void dispose(){
    _stateController.close();
  }

}