import 'package:flutter/services.dart';

class DateBrFormater extends TextInputFormatter {
  final String mask;
  final String separator;

  DateBrFormater({required this.mask, required this.separator});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if (newText.length > 10) {
      return oldValue;
    }

    if (newText.length == 2 || newText.length == 5) {
      newText = '$newText$separator';
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}