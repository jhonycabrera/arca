import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'welcome_controller.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _textoWelcomeInicio(),
              _imageWelcomeInicio(context),
              _textoWelcomeInfo(),
              Column(
                children: [
                  _butonIniciarSesion(context),
                  const SizedBox(height: 20.0),
                  _butonCrearCuenta(context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _textoWelcomeInicio() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Text(
        "ARCA",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _imageWelcomeInicio(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 3,
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/fondo.jpg'))),
  );
}

Widget _textoWelcomeInfo() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        "Hola amigo.",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        "¿Estás listo para ser mi nueva familia?.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
      ),
    ],
  );
}

Widget _butonIniciarSesion(BuildContext context) {
  WelcomeController con = Get.put(WelcomeController());
  return GestureDetector(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF3D4E80),
        onPrimary: Colors.white,
        shadowColor: Color(0xFF3D4E80),
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: Size(200, 40),
      ),
      child: const Text(
        'Iniciar Sesión',
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () => con.goToLoginPage(),
    ),
  );
}

Widget _butonCrearCuenta(BuildContext context) {
  WelcomeController con = Get.put(WelcomeController());
  return GestureDetector(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Color(0xFF3D4E80),
        shadowColor: Colors.black,
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: Size(200, 40),
      ),
      child: Text(
        'Crear Cuenta',
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () => con.goToRegisterPage(),
    ),
  );
}
