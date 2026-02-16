//import 'package:flutter_riverpod/legacy.dart';

//final obscureProvider = StateProvider<bool>((ref) => true);

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObscureProvider extends Notifier<bool> {
  @override
  bool build() {
    return true; //estado incial true de obscure text
  }

  void toggleObscureText() {
    state =
        !state; //estado inicial opuesto,se encarga de cambiar el valor,estado
  }
}

//exportar este provider ,recibe la clase y el tipo de dato
final obscureProvider = NotifierProvider<ObscureProvider, bool>(
  ObscureProvider.new, //inicializamos
);
