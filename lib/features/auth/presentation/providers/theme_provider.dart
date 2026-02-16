import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    //estado por defecto o incial es theme light
    return ThemeMode.light;
  }

  //cambiamos el estadod el tema a dark
  void toogleTheme() {
    // Si es claro -> pasa a oscuro. Si no -> pasa a claro.
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

//exponemos el provider actualizado
final themeProvider = NotifierProvider<ThemeProvider, ThemeMode>(
  ThemeProvider.new,
);
