import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              margin: const EdgeInsets.symmetric(vertical: 200),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Arca',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Iniciar sesión en su cuenta',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30.0),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _textFormCorreoElectronico(),
                        const SizedBox(height: 30.0),
                        _textFormContrasena(),
                        const SizedBox(height: 15.0),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            child: const Text(
                              "¿Olvidaste tu contraseña?",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        _buttonIngresar(),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            con.goToRegisterPage();
                          },
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              "¿Aún no tienes cuenta? Registrate",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => con.isLoading.isTrue
                        ? Container(
                            color: Colors.white60,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
          _buttonBack(),
        ],
      ),
    );
  }
}

Widget _buttonIngresar() {
  LoginController con = Get.put(LoginController());
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF3D4E80),
      shadowColor: Color(0xFF3D4E80),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      minimumSize: Size(200, 40),
    ),
    child: Text(
      'Ingresar'.toUpperCase(),
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    onPressed: () => con.login(),
  );
}

Widget _textFormContrasena() {
  LoginController con = Get.put(LoginController());
  return TextFormField(
    controller: con.passwordController,
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Contraseña',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingrese su contraseña',
      hintStyle: const TextStyle(
        color: Color(0xFFC5C1BE),
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
    ),
  );
}

Widget _textFormCorreoElectronico() {
  LoginController con = Get.put(LoginController());
  return TextFormField(
    controller: con.emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: 'Correo Electrónico',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingrese su correo electrónico',
      hintStyle: const TextStyle(
        color: Color(0xFFC5C1BE),
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
    ),
  );
}

Widget _buttonBack() {
  return SafeArea(
    child: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
  );
}
