import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get_connect/connect.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:logger/logger.dart';

import '../environment/environment.dart';

class RequestAdoptionProvider extends GetConnect {
  String url = Environment.API_URL_ARCA;
  Logger logger = Logger();

  Future<String> postRegistrarSolicitud(
      int idUsuario, int IdMascota, String documento) async {
    try {
      String path = "$url/Solicitud/WS_registrarSolicitud";
      Uri _uri = Uri.parse(path);

      http.Response response = await http.post(
        _uri,
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        },
        body: json.encode({
          "Documento": documento,
          "IdUsuario": idUsuario,
          "IdMascota": IdMascota,
        }),
      );
      return "ok";
    } on TimeoutException catch (e) {
      logger.i(e);
      return Future.error("Error internet 1");
    } on SocketException catch (e) {
      logger.d(e);
      return Future.error("Error internet 2");
    } on Error catch (e) {
      logger.e(e);
      return Future.error("Error internet 3");
    }
  }
}
