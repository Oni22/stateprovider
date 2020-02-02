import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stateprovider/src/statemodel.dart';

class StatefulProvider<T> extends StatefulWidget {

  final StateModel model;
  final Widget child;

  StatefulProvider({
    this.model,
    this.child
  });

  @override
  _StatefulProviderState<T> createState() => _StatefulProviderState<T>();
}

class _StatefulProviderState<T> extends State<StatefulProvider> {
  
  @override
  void initState() {
    widget.model.initState(widget.model);
    super.initState();
  }

  @override
  void dispose() { 
    widget.model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StateModel>(
      stream: widget.model.state,
      builder: (context,snapshot) {
        if(snapshot.data != null) {
          return StateProvider<T>(
            state: snapshot.data,
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
  
  final StateModel state;

  T getState<T>() => state as T;

  StateProvider({Key key, this.state, Widget child})
      : super(key: key, child: child);

  static StateProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: StateProvider);

  @override
  bool updateShouldNotify(StateProvider old) => old.state != state;
  
}