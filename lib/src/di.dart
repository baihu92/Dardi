import 'initial_context.dart';

/// Создатель зависимости.
typedef T DependencyBuilder<T>();

/// Интерфейс DI.
class DI {
  static InitialContext _context;

  static InitialContext get _getContext {
    if (_context != null)
      return _context;
    else
      return _context = InitialContext();
  }

  DI._internal();

  /// Добавляет singleton зависимость.
  static void addSingleton<T>(DependencyBuilder<T> dependency) {
    _getContext.addSingleton(dependency);
  }

  /// Добавляет зависимость.
  static void addDependency<T>(DependencyBuilder<T> dependency) {
    _getContext.addDependency(dependency);
  }

  /// Возвращает зависимость.
  static T getDependency<T>() {
    return _getContext.getDependency();
  }
  
  static void removeDependency<T>(T dependency){
    _getContext.removeSingleton(dependency);
  }
}
