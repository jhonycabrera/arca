import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../environment/environment.dart';
import '../models/Respuesta.dart';
import '../models/UsuarioLogin.dart';
import '../models/UsuarioRegister.dart';
import '../models/response_api.dart';
import '../models/usuario.dart';

class UsersProvider extends GetConnect {
  //String url = Environment.API_URL + 'api/usuario';
  String url = Environment.API_URL_ARCA;
  Logger logger = Logger();

  Future<Response> create(Usuario user) async {
    Response response = await post(
      '$url/create',
      user.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<ResponseApi> login(String correo, String contrasena) async {
    Response response = await post(
      '$url/login',
      {
        'correo': correo,
        'contraseña': contrasena,
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<RespuestaModel?> postRegistrarUsuario(
      UsuarioRegisterModel usuarioRegisterModel) async {
    try {
      String path = "$url/Usuario/WS_registrarUsuario";
      Uri _uri = Uri.parse(path);
      http.Response response = await http.post(
        _uri,
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        },
        body: json.encode(
          usuarioRegisterModel.toJson(),
        ),
      );
      Map<String, dynamic> myMap = json.decode(response.body);
      RespuestaModel respuestaModel = RespuestaModel.fromJson(myMap);
      return respuestaModel;
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

  Future<UsuarioModel> iniciarSesion(String email, String contrasena) async {
    List<UsuarioModel> usuarioModel = [];

    String path =
        "$url/Usuario/WS_loginUser?Usuario=$email&Clave=$contrasena&ind=2";
    Uri _uri = Uri.parse(path);

    http.Response response = await http.post(_uri);

    try {
      if (response.statusCode == 200) {
        String source = const Utf8Decoder().convert(response.bodyBytes);
        final jsonBody = json.decode(source) as List;
        usuarioModel =
            jsonBody.map((data) => UsuarioModel.fromJson(data)).toList();
        return usuarioModel[0];
      }
    } on TimeoutException catch (e) {
      return Future.error(e);
    } on SocketException catch (e) {
      //Esto es cuando no hay internet
      return Future.error(e);
    } on Error catch (e) {
      return Future.error(e);
    } on Exception catch (e) {
      // only executed if error is of type Exception
      return Future.error(e);
    }
    return usuarioModel[0];
    /*
    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return UsuarioModel();
    }

    UsuarioModel usuarioModel = UsuarioModel.fromJson(response.body);
    return usuarioModel;

     */
  }
}
