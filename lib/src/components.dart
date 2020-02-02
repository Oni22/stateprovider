import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stateprovider/stateprovider.dart';

class StatefulProvider<T> extends StatefulWidget {

  final StreamStore<T> store;
  final Widget child;

  StatefulProvider({
    this.store,
    this.child
  });

  @override
  _StatefulProviderState<T> createState() => _StatefulProviderState<T>();
}

class _StatefulProviderState<T> extends State<StatefulProvider> {
  
  @override
  void initState() {
    super.initState();
    widget.store.notify(widget.store);
  }

  @override
  void dispose() { 
    widget.store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StreamStore<T>>(
      stream: widget.store.stream,
      builder: (context,snapshot) {
        if(snapshot.data != null) {
          return StateProvider<T>(
            store: snapshot.data,
            child: widget.child,
          );
        }
        else {
          return Scaffold(
            body: Center(
              child: Text(""),
            ),
          );
        }
      },
    );
  }

}

class StateProvider<T> extends InheritedWidget {
  
  final StreamStore<T> store;

  V getState<V>() => store as V;

  StateProvider({Key key, this.store, Widget child})
      : super(key: key, child: child);

  static StateProvider<T> of<T>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: StateProvider);

  @override
  bool updateShouldNotify(StateProvider<T> old) => true;
  
}