import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get_connect.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../environment/environment.dart';
import '../models/Mascota.dart';
import '../models/animal.dart';

class AnimalsProvider extends GetConnect {
  //String url = Environment.API_URL + 'api/animal';
  String url = Environment.API_URL_ARCA;
  Logger logger = Logger();

  Future<List<MascotaModel>> getListarMascotas() async {
    List<MascotaModel> mascotas = [];

    String path = "$url/Mascota/WS_listarMascotas";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);

    try {
      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        final jsonBody = json.decode(source) as List;
        mascotas = jsonBody.map((data) => MascotaModel.fromJson(data)).toList();
        return mascotas;
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
    return mascotas;
  }

  Future<Response> create(Animal animal) async {
    Response response = await post(
      '$url/create',
      animal.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
