import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract interface class AppTheme {
  FontTheme get font;
  ColorTheme get color;
}

class FontTheme {
  FontTheme(this.fontFamily)
      : heading = TextStyle(
          fontFamily: fontFamily,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        title = TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        body = TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        label = TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        );

  String fontFamily;
  TextStyle heading;
  TextStyle title;
  TextStyle body;
  TextStyle label;
}

class ColorTheme {
  ColorTheme({
    required this.neutral,
    required this.accent,
  });

  NeutralPalette neutral;
  AccentPalette accent;
}

class NeutralPalette {
  NeutralPalette({
    required this.n0,
    required this.n1,
    required this.n2,
    required this.n3,
    required this.n4,
    required this.n5,
    required this.n6,
  });

  Color n0;
  Color n1;
  Color n2;
  Color n3;
  Color n4;
  Color n5;
  Color n6;
}

class ColorPair {
  ColorPair({
    required this.primary,
    required this.secondary,
  });

  Color primary;
  Color secondary;
}

class AccentPalette {
  AccentPalette({
    required this.red,
    required this.orange,
    required this.yellow,
    required this.green,
    required this.blue,
  });

  ColorPair red;
  ColorPair orange;
  ColorPair yellow;
  ColorPair green;
  ColorPair blue;
}
