extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension ToParams on Map<String, dynamic> {
  String toQueryParameter() {
    if (isEmpty) return '';
    String value = '?';
    for (var index = 0; index < length; index++) {
      value = '$value&${keys.elementAt(index)}=${values.elementAt(index)}';
      if (index < length - 1) {
        value = '$value&';
      }
    }

    return value;
  }
}
