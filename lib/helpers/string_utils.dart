extension NullableStringExtensions on String? {
  String orEmpty() {
    return this ?? "";
  }
}

extension NullableNumberExtensions on int? {
  int orZero() {
    return this ?? 0;
  }

  bool toBoolean() {
    return this == null ? false : this == 1;
  }
}