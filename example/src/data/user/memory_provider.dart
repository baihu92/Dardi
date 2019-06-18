import 'data.dart';

class UserMemoryProvider {
  Map<int, User> users = {};

  Future<User> get(int id) async {
    Future.delayed(Duration(seconds: 1));

    if (id % 2 == 0)
      return User(id, 'Bob', 23);
    else
      return null;
  }

  Future<void> insertOrUpdate(User user) async {
    users[user.id] = user;
  }
}
