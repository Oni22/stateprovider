import 'dart:async';

class StreamStore<T> {

  final _streamController = StreamController<T>();
  Stream<T> get stream => _streamController.stream;
  StreamSink<T> get _sink => _streamController.sink;

  void init(T model) {
    _streamController.add(model);
  }
  void notify(T model) => _sink.add(model);

  void dispose(){
    _streamController.close();
  }

}