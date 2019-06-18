# Dardi

Lightweight dependency Injection library based on service locator pattern with a terse interface.

``` 
main() async {
  //1) Register the necessary dependencies.
  Dardi.addSingleton(() => UserNetworkProvider());
  Dardi.addSingleton(() => UserMemoryProvider());

  //2) Register and get the necessary dependencies.
  Dardi.addDependency(() => UserRepository(
        Dardi.getDependency(),
        Dardi.getDependency(),
      ));

  var view = UserTerminalView();
  view.show();
}

class UserTerminalView {
  //3) And get the necessary dependencies.
  final UserRepository _repository = Dardi.getDependency();

  void show() async {
      ***
  }
}
```

## Installation

Add on pubspec.yml:

```
  dependencies:
    dardi: ^0.1.0
```


## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
