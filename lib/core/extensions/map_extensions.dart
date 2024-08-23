extension JsonExtensions on Map<String, dynamic> {
  String toNonNullableString(
    String key, {
    String defaultValue = '',
  }) {
    final value = this[key];
    return value as String? ?? defaultValue;
  }
}

extension ListExtensions on List<dynamic> {
  List<Map<String, dynamic>> toListMap() {
    return cast<Map<String, dynamic>>();
  }
}
