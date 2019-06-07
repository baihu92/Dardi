import 'di.dart';
import 'build_policy.dart';

class InitialContext {
  Map<String, BuildPolicy> _creators = {};
  Map<String, Object> _singletonCache = {};

  void addSingleton<T>(DependencyBuilder<T> dependency) {
    _register(dependency, true);
  }

  addDependency<T>(DependencyBuilder<T> dependency) {
    _register(dependency, false);
  }

  void _register<T>(DependencyBuilder<T> dependency, bool isSingleton) {
    final key = T.toString();

    if (_creators.containsKey(key)) throw Exception("$key already added.");

    _creators[key] = BuildPolicy(dependency, isSingleton);
  }

  T getDependency<T>() {
    final key = T.toString();

    if (key == 'dynamic') {
      throw Exception("Dynamic type is not injectable.");
    }
    if (!_creators.containsKey(key)) {
      throw Exception("$key is dependency not found");
    }

    BuildPolicy policy = _creators[key];
    if (policy.isSingleton) {
      var singleton = _singletonCache[key];
      if (singleton != null) {
        return singleton;
      } else {
        singleton = _creators[key].builder();
        _singletonCache[key] = singleton;
        return singleton;
      }
    }

    return _creators[key].builder();
  }

  void removeSingleton<T>(T dependency) {
    final key = T.toString();

    if (key == 'dynamic') {
      throw Exception("Dynamic type is not injectable.");
    }
    if (!_creators.containsKey(key)) {
      throw Exception("$key is dependency not found");
    }
    if (!_singletonCache.containsKey(key)) {
      throw Exception("$key already removed.");
    }

    _singletonCache[key] = null;
  }
}
