import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_veterinaria_arca/models/Color.dart';
import 'package:proyecto_veterinaria_arca/models/MascotaRegister.dart';
import 'package:proyecto_veterinaria_arca/models/Raza.dart';
import '../../environment/environment.dart';
import '../../x/adoptar_provider.dart';
import '../../x/animal_provider.dart';
import '../../z/usuario_conntroller.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RegisterAnimalController extends GetxController {
  String url = Environment.API_URL_ARCA;
  Logger logger = Logger();

  GlobalKey<FormFieldState> keySexo = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> keyTamano = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> keyRaza = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> keyColor = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> keyCategoria = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> keyEsterilizado = GlobalKey<FormFieldState>();

  ImagePicker picker = ImagePicker();
  ImagePicker picker2 = ImagePicker();
  ImagePicker picker3 = ImagePicker();
  File? imageFile;
  File? imageFile2;
  File? imageFile3;
  final load = false.obs;
  final load2 = false.obs;
  final load3 = false.obs;
  final isLoading = false.obs;
  String sexo = "";
  String tamano = "";
  String raza = "";
  String color = "";
  String categoria = "";
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;
  List<String> sexItems = [
    "MACHO",
    "HEMBRA",
  ];

  List<String> esterilizadoItems = [
    "SI",
    "NO",
  ];

  List<String> tamanoItems = [
    "GRANDE",
    "MEDIANO",
    "PEQUEÑO",
  ];

  void goToHomePage() {
    Get.offNamedUntil('/home', (route) => false);
  }

  List<ColorModel> colorItems = [];
  List<RazaModel> razaItems = [];

  TextEditingController id_usuarioController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController tipoController = TextEditingController();
  TextEditingController razaController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController edadController = TextEditingController();
  TextEditingController tamanoController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();
  TextEditingController vacunaController = TextEditingController();
  TextEditingController esterilizadoController = TextEditingController();

  AdoptarProvider adoptarProvider = AdoptarProvider();
  AnimalsProvider animalsProvider = AnimalsProvider();
  UsuarioController usuarioController = UsuarioController();

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      if (load.isFalse) {
        load(!load.value);
      }
      Get.back();
    }
  }

  Future selectImage2(ImageSource imageSource) async {
    XFile? image = await picker2.pickImage(source: imageSource);
    if (image != null) {
      imageFile2 = File(image.path);
      if (load2.isFalse) {
        load2(!load2.value);
      }
      Get.back();
    }
  }

  Future selectImage3(ImageSource imageSource) async {
    XFile? image = await picker3.pickImage(source: imageSource);
    if (image != null) {
      imageFile3 = File(image.path);
      if (load3.isFalse) {
        load3(!load3.value);
      }
      Get.back();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      onPressed: () {
        selectImage(ImageSource.gallery);
      },
      child: Text(
        'GALERIA',
        style: TextStyle(color: Colors.black),
      ),
    );
    Widget cameraButton = ElevatedButton(
      onPressed: () {
        selectImage(ImageSource.camera);
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

  void showAlertDialog2(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      onPressed: () {
        selectImage2(ImageSource.gallery);
      },
      child: Text(
        'GALERIA',
        style: TextStyle(color: Colors.black),
      ),
    );
    Widget cameraButton = ElevatedButton(
      onPressed: () {
        selectImage2(ImageSource.camera);
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

  void showAlertDialog3(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      onPressed: () {
        selectImage3(ImageSource.gallery);
      },
      child: Text(
        'GALERIA',
        style: TextStyle(color: Colors.black),
      ),
    );
    Widget cameraButton = ElevatedButton(
      onPressed: () {
        selectImage3(ImageSource.camera);
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

  Future<String> uploadImage1Firebase() async {
    firebase_storage.Reference _reference = _storage.ref().child("mascotas");
    String time = DateTime.now().toString();
    firebase_storage.TaskSnapshot upload = await _reference
        .child('Mascota1$time.jpg')
        .putFile(File(imageFile!.path));
    String url = await upload.ref.getDownloadURL();
    return url;
  }

  Future<String> uploadImage2Firebase() async {
    firebase_storage.Reference _reference = _storage.ref().child("mascotas");
    String time = DateTime.now().toString();
    firebase_storage.TaskSnapshot upload = await _reference
        .child('Mascota2$time.jpg')
        .putFile(File(imageFile2!.path));
    String url = await upload.ref.getDownloadURL();
    return url;
  }

  Future<String> uploadImage3Firebase() async {
    firebase_storage.Reference _reference = _storage.ref().child("mascotas");
    String time = DateTime.now().toString();
    firebase_storage.TaskSnapshot upload = await _reference
        .child('Mascota3$time.jpg')
        .putFile(File(imageFile3!.path));
    String url = await upload.ref.getDownloadURL();
    return url;
  }

  void postRegistrarAdopcionAnimal() async {
    String id_usuario = id_usuarioController.text.trim();
    String image = imageController.text;
    String nombre = nombreController.text;
    String tipo = tipoController.text;
    String razaSeleccionado = razaController.text.trim();
    String edad = edadController.text.trim();
    String tamanoSeleccionado = tamanoController.text.trim();
    String categoriaSeleccionado = categoriaController.text;
    String colorSeleccionado = colorController.text;
    String sexoSeleccionado = sexoController.text;
    String nrovacunas = vacunaController.text;
    String esterilizadoItem = esterilizadoController.text;
    bool itemEsterilizado = false;
    if (esterilizadoItem == "SI") {
      itemEsterilizado = true;
    } else {
      itemEsterilizado = false;
    }
    bool imagen1 = load.value;
    bool imagen2 = load2.value;
    bool imagen3 = load3.value;

    if (isValidForm(
        categoriaSeleccionado,
        nombre,
        razaSeleccionado,
        colorSeleccionado,
        edad,
        nrovacunas,
        tamanoSeleccionado,
        sexoSeleccionado,
        esterilizadoItem,
        imagen1,
        imagen2,
        imagen3)) {
      isLoading.value = true;
      String url1 = await uploadImage1Firebase();
      String url2 = await uploadImage2Firebase();
      String url3 = await uploadImage3Firebase();

      MascotaRegisterModel mascotaRegisterModel = MascotaRegisterModel(
          descripcion: nombre,
          idCategoria: int.parse(categoriaSeleccionado),
          edad: int.parse(edad),
          genero: sexoSeleccionado,
          idColor: int.parse(colorSeleccionado),
          idRaza: int.parse(razaSeleccionado),
          idUsuario: int.parse(usuarioController.usuario.idUsuario!),
          imagen1: url1,
          imagen2: url2,
          imagen3: url3,
          vacunas: nrovacunas,
          tamanio: tamanoSeleccionado,
          esterelizado: itemEsterilizado);

      await adoptarProvider.postRegistrarAdopcion(mascotaRegisterModel);
      isLoading.value = false;
      goToHomePage();
      Get.snackbar("Mascota registrada", 'Listo');
    }
  }

  /*
  Future<void> register() async {
    String id_usuario = id_usuarioController.text.trim();
    String image = imageController.text;
    String nombre = nombreController.text;
    String tipo = tipoController.text;
    String raza = razaController.text.trim();
    String edad = edadController.text.trim();
    String tamano = tamanoController.text.trim();
    String sexo = sexoController.text;

    if (isValidForm(nombre, raza, edad)) {
      Animal animal = Animal(
        idUsuario: id_usuario,
        image: image,
        nombre: nombre,
        tipo: tipo,
        raza: raza,
        edad: edad,
        tamano: tamano,
        sexo: sexo,
      );

      Response response = await animalsProvider.create(animal);

      print('RESPONSE: ${response.body}');

      Get.snackbar('Formulario valido', 'Registro exitoso');
    }
  }
*/
  bool isValidForm(
    String categoria,
    String nombre,
    String raza,
    String color,
    String edad,
    String nrovacunas,
    String tamano,
    String sexo,
    String esterilizadoItem,
    bool imagen1,
    bool imagen2,
    bool imagen3,
  ) {
    if (categoria.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe seleccionar la categoria');
      return false;
    }

    if (nombre.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar el nombre');
      return false;
    }

    if (raza.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe seleccionar la raza');
      return false;
    }

    if (color.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe seleccionar el color');
      return false;
    }

    if (edad.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe ingresar la edad');
      return false;
    }

    if (nrovacunas.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'Debe ingresar el numero de vacunas');
      return false;
    }

    if (tamano.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe seleccionar el tamaño');
      return false;
    }

    if (sexo.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debe seleccionar el sexo');
      return false;
    }

    if (esterilizadoItem.isEmpty) {
      Get.snackbar(
          'Formulario no valido', 'Debe ingresar la opcion de Esterilizacion');
      return false;
    }

    if (imagen1 == false) {
      Get.snackbar('Formulario no valido', 'Debe ingresar la imagen 1');
      return false;
    }

    if (imagen2 == false) {
      Get.snackbar('Formulario no valido', 'Debe ingresar la imagen 2');
      return false;
    }

    if (imagen3 == false) {
      Get.snackbar('Formulario no valido', 'Debe ingresar la imagen 3');
      return false;
    }

    return true;
  }

  Future<List<RazaModel>> listAllRazas() async {
    razaItems = await adoptarProvider.getListarRaza();
    var lista = razaItems.toList();
    //GetStorage().write('categorias', lista);
    return razaItems;
  }

  Future<List<ColorModel>> listAllColor() async {
    colorItems = await adoptarProvider.getListarColor();
    //GetStorage().write('categorias', lista);
    return colorItems;
  }
}
