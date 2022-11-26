import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto_veterinaria_arca/environment/preferencias_usuario.dart';
import 'package:proyecto_veterinaria_arca/z/usuario_conntroller.dart';

import '../../models/UsuarioLogin.dart';
import '../../x/usuario_provider.dart';
import '../../z/logueado_controller.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  PreferenciasUsuario prefs = PreferenciasUsuario();
  UsersProvider usersProvider = UsersProvider();
  final isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (isValidForm(email, password)) {
      UsuarioModel usuarioModel =
          await usersProvider.iniciarSesion(email, password);
      var usuario = usuarioModel.toJson();
      if (usuarioModel.resultado == "0") {
        prefs.logueado = true;
        GetStorage().write('usuario', usuario);
        Get.snackbar(usuarioModel.mensaje!, 'Estas listo');
        goToHomePage();
      } else {
        Get.snackbar('Login fallido', usuarioModel.nombres ?? '');
      }
      isLoading.value = false;
    }
  }

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void goToHomePage() {
    Get.offNamedUntil('/home', (route) => false);
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar un usuario');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El usuario no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar la clave');
      return false;
    }

    return true;
  }
}
