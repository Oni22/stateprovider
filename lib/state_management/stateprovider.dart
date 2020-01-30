import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilepkg/state_management/statemodel.dart';

class StateProviderListener extends StatefulWidget {

  final StateModel model;
  final Widget child;

  StateProviderListener({
    this.model,
    this.child
  });

  @override
  _StateProviderListenerState createState() => _StateProviderListenerState();
}

class _StateProviderListenerState extends State<StateProviderListener> {
  
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
          return StateProvider(
            state: snapshot.data,
            child: widget.child,
          );
      },
    );
  }

}

class StateProvider extends InheritedWidget {
  
  final StateModel state;

  T getState<T>() => state as T;

  StateProvider({Key key, this.state, Widget child})
      : super(key: key, child: child);

  static StateProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: StateProvider);

  @override
  bool updateShouldNotify(StateProvider old) => true;
}