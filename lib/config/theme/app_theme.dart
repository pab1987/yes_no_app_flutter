import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF07E730);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.purple,
  Colors.green,
  Colors.pink,
  Colors.cyan
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length -1,
            'Colors must be between o and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
