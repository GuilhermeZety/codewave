class NumberUtils {
  // static String treatePhoneNumber(String number) => number.replaceAll(RegExp(r'[ \-()]'), '');

  static int? onlyNumbers(String number) => int.tryParse(number.replaceAll(RegExp(r'[^0-9]'), ''));
}
