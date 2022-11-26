import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../environment/environment.dart';
import '../models/Categoria.dart';

class CategoriaProvider extends GetConnect {
  String url = Environment.API_URL_ARCA;
  Logger logger = Logger();

  Future<List<CategoriaModel>> getListarCategoria() async {
    List<CategoriaModel> categorias = [];

    String path = "$url/Categoria/WS_listarCategorias";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);

    try {
      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        final jsonBody = json.decode(source) as List;
        categorias =
            jsonBody.map((data) => CategoriaModel.fromJson(data)).toList();
        return categorias;
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
    return categorias;
  }
}
