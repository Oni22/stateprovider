# StateProvider for Flutter

An easy and lightweight StateProvider for handling global data. This Plugin wraps an InheritedWidget into a StreamBuilder for updating the UI if any changes appears in InheritedWidget.

## Getting Started


#### 1. Import stateprovider

```dart 
import 'package:stateprovider/stateprovider.dart';
```


#### 2. Create a Model which extends the StreamStore class. Add your custom attributes and functions. Call notify() in every function where you want to update the state.

```dart
class MyModel extends StreamStore<MyModel> {

  String name = "";
  int age = 0; 

  //stores only the new data but doesn't update the ui
  void setName(String name) {
    this.name = name;
  } 

  //updates the ui because of notify()
  void setAge(int age) {
    this.index = index;
    notify();
  }

}
```


#### 3. Add the StatefulProvider widget in the SECOND position of your tree under MaterialApp or CupertinoApp. Add your custom Model to the StatefulProvider.

```dart
void main() => runApp(
  MaterialApp(
    home: StatefulProvider(
      store: MyModel(),
      child: PageOne(),
    ),
  )
);
```


### 4. Now inside your widget you can use your data with the StateProvider class:

```dart
StateProvider.of(context).getState<MyModel>().setAge(34)
```

### Additional

if you want to update the state manually use:

```dart
StateProvider.of(context).getState<MyModel>().notify()
```

