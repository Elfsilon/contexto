import 'package:cringe/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LigthTheme implements AppTheme {
  @override
  get font => FontTheme("Roboto");

  @override
  get color => ColorTheme(
        neutral: NeutralPalette(
          n0: const Color(0xFF212121),
          n1: const Color(0xFF757575),
          n2: const Color(0xFFAEAEAE),
          n3: const Color(0xFFDBDBDB),
          n4: const Color(0xFFEDEDED),
          n5: const Color(0xFFF9F9F9),
          n6: const Color(0xFFFFFFFF),
        ),
        accent: AccentPalette(
          red: ColorPair(
            primary: const Color(0xFFE91515),
            secondary: const Color(0xFFF1DDDD),
          ),
          orange: ColorPair(
            primary: const Color(0xFFF7A01E),
            secondary: const Color(0xFFF3ECE2),
          ),
          yellow: ColorPair(
            primary: const Color(0xFFF4D013),
            secondary: const Color(0xFFF2EFDE),
          ),
          green: ColorPair(
            primary: const Color(0xFF74B621),
            secondary: const Color(0xFFE9F2DE),
          ),
          blue: ColorPair(
            primary: const Color(0xFF3B85F4),
            secondary: const Color(0xFFE2E9F3),
          ),
        ),
      );
}
