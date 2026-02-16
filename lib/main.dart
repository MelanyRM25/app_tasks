import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_to_do_app/core/routes/app_router.dart';
import 'package:tasks_to_do_app/core/theme/app_theme.dart';
import 'package:tasks_to_do_app/features/auth/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(themeProvider),

      //home: LoginPage(),

      //Rutas definidas en AppRouter
      routes: AppRouter.routes,
      //Ruta Inicial
      initialRoute: AppRouter.login,
    );
  }
}
