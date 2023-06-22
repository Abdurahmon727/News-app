extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
}
