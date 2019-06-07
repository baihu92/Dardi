import 'di.dart';

/// Политика создания и хранения зависимости.
class BuildPolicy {
  final DependencyBuilder builder;
  final bool isSingleton;

  BuildPolicy(this.builder, this.isSingleton);
}
