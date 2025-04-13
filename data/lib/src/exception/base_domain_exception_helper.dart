import 'package:domain/domain.dart' as domain;

mixin BaseDomainExceptionHelper<TD extends domain.BaseRepositoryException>
    implements Exception {
  TD get map;

  dynamic get value;

  bool isEqual(dynamic value) {
    if (value is String) {
      return toString() == value || this.value == value;
    } else if (value is int) {
      return this.value == value;
    } else {
      return toString() == value.toString();
    }
  }

  @override
  String toString() {
    return '$runtimeType:$value';
  }
}
