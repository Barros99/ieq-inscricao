import 'package:flutter/services.dart';

class CellBrFormater extends TextInputFormatter {
  final String mask;
  final String separator;

  CellBrFormater({required this.mask, required this.separator});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if (newText.length > 15) {
      return oldValue;
    }

    if (newText.length == 1) {
      newText = '($newText';
    }

    if (newText.length == 3) {
      newText = '$newText)$separator';
    }

    if (newText.length == 10) {
      newText = '$newText-';
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
