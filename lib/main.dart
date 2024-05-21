import 'package:cringe/core/theme/app_theme_provider.dart';
import 'package:cringe/core/theme/light_theme.dart';
import 'package:cringe/hz/controllers/study_cubit.dart';
import 'package:cringe/hz/screens/study_screen.dart';
import 'package:cringe/hz/services/study_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = LigthTheme();

    return AppThemeProvider(
      theme: theme,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            fontFamily: theme.font.fontFamily,
            useMaterial3: true,
          ),
          home: DefaultTextStyle.merge(
            style: theme.font.body,
            child: BlocProvider(
              // TODO: refactor DI
              create: (_) => StudyCubit(StudyService()),
              child: const StudyScreen(),
            ),
          )),
    );
  }
}
