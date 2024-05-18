import 'package:cringe/core/theme/app_theme.dart';
import 'package:cringe/core/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  AppTheme get theme => AppThemeProvider.of(this).theme;
}
