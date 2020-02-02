import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stateprovider/src/statemodel.dart';

class StateProvider<T> extends StatefulWidget {

  final StateModel model;
  final Widget child;

  StateProvider({
    this.model,
    this.child
  });

  @override
  _StateProviderState<T> createState() => _StateProviderState<T>();
}

class _StateProviderState<T> extends State<StateProvider> {
  
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
          return _InheritedStateWidget<T>(
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

class _InheritedStateWidget<T> extends InheritedWidget {
  
  final StateModel state;

  T getState<T>() => state as T;

  _InheritedStateWidget({Key key, this.state, Widget child})
      : super(key: key, child: child);

  static _InheritedStateWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: _InheritedStateWidget);

  @override
  bool updateShouldNotify(_InheritedStateWidget old) => old.state != state;
  
}