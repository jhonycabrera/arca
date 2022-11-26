import 'package:shared_preferences/shared_preferences.dart';


class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set logueado(bool value){
    _prefs.setBool("logueado", value);
  }

  bool get logueado {
    return _prefs.getBool("logueado") ?? false;
  }

  String get getvalidarSesion {
    late String res;
    if (_prefs.getBool('logueado') == false) {
      res = '/';
    } else {
      res = '/home';
    }
    return res;
  }




}
