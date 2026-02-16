//almacenamos todas las rutas
import 'package:flutter/material.dart';
import 'package:tasks_to_do_app/features/auth/presentation/pages/login_page.dart';
import 'package:tasks_to_do_app/features/home/presentation/pages/home_page.dart';
import 'package:tasks_to_do_app/features/user_management/presentation/pages/new_user_page.dart';

class AppRouter {
  AppRouter._(); //evitar instanciar la clase

  //Nombres de las rutas
  static const String login = '/login';
  static const String newUser = '/newUser';
  static const String home = '/';

  //Mapa de rutas
  static Map<String, WidgetBuilder> get routes => {
    login: (context) => LoginPage(),
    newUser: (context) => NewUserPage(),
    home: (context) => HomePage(),
  };
  //Rutas generadas para casos con argumentos
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        final args = settings.arguments as Map<String, dynamic>?;
        final String? email = args?['email'] ?? '';
        return MaterialPageRoute(builder: (context) => LoginPage(email: email));

      case newUser:
        return MaterialPageRoute(builder: (context) => NewUserPage());
      case home:
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }

  //Navegacion simple con push
  static Future<T?> push<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }
}
