import 'package:cringe/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends InheritedWidget {
  const AppThemeProvider({
    super.key,
    required this.theme,
    required super.child,
  });

  final AppTheme theme;

  static AppThemeProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppThemeProvider>();
  }

  static AppThemeProvider of(BuildContext context) {
    final AppThemeProvider? result = maybeOf(context);
    assert(result != null, 'No AppThemeProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppThemeProvider oldWidget) => theme != oldWidget.theme;
}
