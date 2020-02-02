import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stateprovider/src/statemodel.dart';

class StatefulProvider<T> extends StatefulWidget {

  final StreamStore store;
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
  }

  @override
  void dispose() { 
    widget.store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StreamStore>(
      stream: widget.store.stream,
      builder: (context,snapshot) {
        if(snapshot.data != null) {
          return StateProvider(
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

class StateProvider extends InheritedWidget {
  
  final StreamStore store;

  T getState<T>() => store as T;

  StateProvider({Key key, this.store, Widget child})
      : super(key: key, child: child);

  static StateProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: StateProvider);

  @override
  bool updateShouldNotify(StateProvider old) => old.store != store;
  
}