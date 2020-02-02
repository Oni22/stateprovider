import 'dart:async';

class StreamStore<T> {

  final _storeController = StreamController<T>();
  Stream<T> get stream => _storeController.stream;
  StreamSink get _sink => _storeController.sink;

  StreamStore() {
    notify();
  }

  void notify() => _sink.add(this as T);

  void dispose(){
    _storeController.close();
  }

}