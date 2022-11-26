import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_veterinaria_arca/models/Color.dart';
import '../environment/environment.dart';
import '../models/MascotaRegister.dart';
import '../models/Raza.dart';

class AdoptarProvider extends GetConnect {
  String url = Environment.API_URL_ARCA;
  Logger logger = Logger();

  Future<String> postRegistrarAdopcion(
      MascotaRegisterModel mascotaRegisterModel) async {
    try {
      String path = "$url/Mascota/WS_registrarMascota";
      Uri _uri = Uri.parse(path);

      http.Response response = await http.post(
        _uri,
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        },
        body: json.encode(mascotaRegisterModel.toJson()),
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

  Future<List<RazaModel>> getListarRaza() async {
    List<RazaModel> razas = [];

    String path = "$url/Raza/WS_listarRazas";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);

    try {
      if (response.statusCode == 200) {
        String source = const Utf8Decoder().convert(response.bodyBytes);
        final jsonBody = json.decode(source) as List;
        razas = jsonBody.map((data) => RazaModel.fromJson(data)).toList();
        return razas;
      }
    } on TimeoutException catch (e) {
      logger.i(e);
      return Future.error(e);
    } on SocketException catch (e) {
      //Esto es cuando no hay internet
      logger.d(e);
      return Future.error(e);
    } on Error catch (e) {
      logger.e(e);
      return Future.error(e);
    } on Exception catch (e) {
      // only executed if error is of type Exception
      return Future.error(e);
    }
    return razas;
  }

  Future<List<ColorModel>> getListarColor() async {
    List<ColorModel> colores = [];

    String path = "$url/Color/WS_listarColor";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);

    try {
      if (response.statusCode == 200) {
        String source = const Utf8Decoder().convert(response.bodyBytes);
        final jsonBody = json.decode(source) as List;
        colores = jsonBody.map((data) => ColorModel.fromJson(data)).toList();
        return colores;
      }
    } on TimeoutException catch (e) {
      logger.i(e);
      return Future.error(e);
    } on SocketException catch (e) {
      //Esto es cuando no hay internet
      logger.d(e);
      return Future.error(e);
    } on Error catch (e) {
      logger.e(e);
      return Future.error(e);
    } on Exception catch (e) {
      // only executed if error is of type Exception
      return Future.error(e);
    }
    return colores;
  }
}
