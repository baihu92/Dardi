import 'dart:convert';
import 'dart:io';

import 'package:dardi/dardi.dart';

import 'data/data.dart';

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
    print("please input user id: ");

    try {
      var id = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
      User user = await _repository.get(int.parse(id));

      if (user != null) {
        print(user.toString());
      } else {
        print("User with this ID was not found.");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
