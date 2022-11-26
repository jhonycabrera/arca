import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../environment/environment.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../x/request_adoption_provider.dart';

class RequestAdoptionController extends GetxController {
  String url = Environment.API_URL_ARCA;
  Logger logger = Logger();
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;
  RequestAdoptionProvider requestAdoptionProvider =
      Get.put(RequestAdoptionProvider());
  final isLoading = false.obs;
  FilePickerResult? result;
  PlatformFile? file;
  late String name = "";
  late String urlDocumento = "";
  final load = false.obs;

  void Seleccionar() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      file = result!.files.first;
      if (load.isFalse) {
        load(!load.value);
      }
      name = file!.name;
      urlDocumento = file!.path!;
      print(file!.name);
      print(file!.bytes);
      print(file!.size);
      print(file!.extension);
      print(file!.path);
    } else {
      print("No file selected");
    }
  }

  Future<String> uploadDocumentFirebase() async {
    firebase_storage.Reference _reference = _storage.ref().child("documentos");
    String time = DateTime.now().toString();
    firebase_storage.TaskSnapshot upload =
        await _reference.child('$time.pdf').putFile(File(file!.path!));
    String url = await upload.ref.getDownloadURL();
    return url;
  }

  Future<String> postRegistrarSolicitud(int idUsuario, int IdMascota) async {
    if (load.isTrue) {
      isLoading.value = true;
      String url = await uploadDocumentFirebase();
      String? response = await requestAdoptionProvider.postRegistrarSolicitud(
          idUsuario, IdMascota, url);
      isLoading.value = false;
      goToHomePage();
      Get.snackbar("Adopcion solicitada", 'Gracias');
      return response;
    } else {
      Get.snackbar("Debe ingresar el documento", 'Verifica');
    }
    return "nada";
  }

  void goToHomePage() {
    Get.offNamedUntil('/home', (route) => false);
  }
}
