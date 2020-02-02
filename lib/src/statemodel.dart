import 'dart:async';

class Store<T> {
  final _streamController = StreamController<T>();
  Stream<T> get stream => _streamController.stream;
  StreamSink<T> get _sink => _streamController.sink;

  void notify() => _sink.add(this as T);

  void dispose() {
    _streamController.close();
  }
}
