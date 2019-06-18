import 'data.dart';
import 'dart:math';

class UserNetworkProvider {
  Future<User> get(int id) async {
    Future.delayed(Duration(seconds: 1));

    var hasException = Random().nextBool();

    if (hasException) throw Exception('Some exception');

    if (id % 2 == 0)
      return User(id, 'Bob', 23);
    else
      return null;
  }
}
