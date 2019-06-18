import 'data.dart';
import 'network_provider.dart';
import 'memory_provider.dart';

class UserRepository {
  final UserNetworkProvider _networkProvider;
  final UserMemoryProvider _memoryProvider;

  UserRepository(this._networkProvider, this._memoryProvider);

  Future<User> get(int id) async {
    try {
      User user = await _networkProvider.get(id);
      if (user != null)
        _memoryProvider.insertOrUpdate(user);
      return user;
    } catch (e) {
      User user = await _memoryProvider.get(id);
      if (user != null)
        return user;
      else
        throw e;
    }
  }
}
