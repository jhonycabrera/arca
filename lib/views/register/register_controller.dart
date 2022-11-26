import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/Respuesta.dart';
import '../../models/UsuarioRegister.dart';
import '../../x/usuario_provider.dart';
import '../welcome/welcome_controller.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RegisterController extends GetxController {
  WelcomeController con = Get.put(WelcomeController());
  ImagePicker pickerRegister = ImagePicker();
  File? imageFileRegister;
  final loadRegister = false.obs;
  final checkboxValue = false.obs;
  final isLoading = false.obs;

  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  TextEditingController dniController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confiPasswordController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController fechaNacimientoController = TextEditingController();
  String sexo = "";
  UsersProvider usersProvider = UsersProvider();
  GlobalKey<FormFieldState> keySexo = GlobalKey<FormFieldState>();
  List<String> sexItems = [
    "MASCULINO",
    "FEMENINO",
  ];

  aceptarTerminosCondiciones() {
    checkboxValue(!checkboxValue.value);
  }

  Future<String> uploadImageFirebase(String dni, String nombre) async {
    firebase_storage.Reference _reference = _storage.ref().child("fotosperfil");
    String time = DateTime.now().toString();
    firebase_storage.TaskSnapshot upload = await _reference
        .child('$dni$nombre.jpg')
        .putFile(File(imageFileRegister!.path));
    String url = await upload.ref.getDownloadURL();
    return url;
  }

  Future<void> register() async {
    String dni = dniController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;
    String genero = generoController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confipassword = confiPasswordController.text.trim();
    String image = imageController.text;
    String fechaNacimiento = fechaNacimientoController.text;

    if (isValidForm(
        dni, name, lastname, phone, email, password, confipassword, image)) {
      String nombreCompleto =
          "${name.replaceAll(RegExp(r"\s+\b|\b\s"), "")}${lastname.replaceAll(RegExp(r"\s+\b|\b\s"), "")}";
      String nombre = nombreCompleto.trim();

      if (checkboxValue.isFalse) {
        Get.snackbar("Debe aceptar los Terminos y Conficiones", 'Verifica');
      } else {
        if (password != confipassword) {
          Get.snackbar("Las contraseñas no concinciden", 'Verifica');
        } else {
          if (loadRegister.isFalse) {
            Get.snackbar('Debe ingresar una imagen', 'Verifica');
          } else {
            isLoading.value = true;
            String url = await uploadImageFirebase(dni, nombre);
            UsuarioRegisterModel usuario = UsuarioRegisterModel(
                docTipo: "DNI",
                docNumero: dni,
                apellidos: lastname,
                nombres: name,
                genero: genero == "" ? "MASCULINO" : genero,
                telefono: phone,
                fechaNacimiento: fechaNacimiento,
                email: email,
                userName: "----",
                clave: password,
                imagen: url,
                idTipoRegistro: 2);

            RespuestaModel? response =
                await usersProvider.postRegistrarUsuario(usuario);

            isLoading.value = false;
            if (response!.resultado == "3") {
              Get.snackbar(response.mensaje, 'Ingresa otro numero');
            } else if (response.resultado == "2") {
              Get.snackbar(response.mensaje, 'Ingresa otro email');
            } else {
              Get.snackbar(response.mensaje, 'Estas listo');
              con.goToLoginPage();
            }
          }
        }
      }
    }
  }

  bool isValidForm(
    String dni,
    String name,
    String lastname,
    String phone,
    String email,
    String password,
    String confipassword,
    String image,
  ) {
    if (name.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar su nombre');
      return false;
    }

    if (lastname.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar su apellido');
      return false;
    }

    if (phone.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar su numero telefonco');
      return false;
    }

    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar un correo');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El correo no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar una clave');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'Debe ingresar la confirmacion de la clave');
      return false;
    }

    if (password != confipassword) {
      Get.snackbar('Formulario no valido', 'La contraseña no coinciden');
      return false;
    }

    return true;
  }

  Future selectImageRegister(ImageSource imageSource) async {
    XFile? image = await pickerRegister.pickImage(source: imageSource);
    if (image != null) {
      imageFileRegister = File(image.path);
      if (loadRegister.isFalse) {
        loadRegister(!loadRegister.value);
      }
      Get.back();
    }
  }

  void showAlertDialogRegister(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      onPressed: () {
        selectImageRegister(ImageSource.gallery);
      },
      child: Text(
        'GALERIA',
        style: TextStyle(color: Colors.black),
      ),
    );
    Widget cameraButton = ElevatedButton(
      onPressed: () {
        selectImageRegister(ImageSource.camera);
      },
      child: Text(
        'CAMARA',
        style: TextStyle(color: Colors.black),
      ),
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [
        galleryButton,
        cameraButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
