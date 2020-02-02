import 'dart:async';

class StreamStore<T> {

  final _storeController = StreamController<T>();
  Stream<T> get stream => _storeController.stream;
  StreamSink get _sink => _storeController.sink;

  void notify(T model) => _sink.add(model);

  void dispose(){
    _storeController.close();
  }

}