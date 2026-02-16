import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_to_do_app/core/theme/app_theme.dart';
import 'package:tasks_to_do_app/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      home: LoginPage(),
    );
  }
}
