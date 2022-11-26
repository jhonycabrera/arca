import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto_veterinaria_arca/environment/preferencias_usuario.dart';
import 'package:proyecto_veterinaria_arca/z/usuario_conntroller.dart';

import '../../environment/db/db_arca.dart';
import '../../models/Categoria.dart';
import '../../models/Mascota.dart';
import '../../models/Raza.dart';
import '../../models/UsuarioLogin.dart';
import '../../x/adoptar_provider.dart';
import '../../x/animal_provider.dart';
import '../../x/categoria_provider.dart';
import '../../z/logueado_controller.dart';
import 'mascota_controller.dart';

class HomeController extends GetxController {
  UsuarioModel user = UsuarioModel.fromJson(GetStorage().read('usuario') ?? {});
  PreferenciasUsuario prefs = PreferenciasUsuario();
  GlobalKey<FormFieldState> keyRaza = GlobalKey<FormFieldState>();
  List<RazaModel> razaItems = [];

  AdoptarProvider adoptarProvider = AdoptarProvider();

  Future<List<RazaModel>> listAllRazas() async {
    razaItems = await adoptarProvider.getListarRaza();
    var lista = razaItems.toList();
    //GetStorage().write('categorias', lista);
    return razaItems;
  }

  HomeController() {
    print('USUARIO DE SESION: ${user.toJson()}');
  }

  void eliminarUsuario() {
    Get.delete<UsuarioController>();
  }

  void cerrarSesion() {
    prefs.logueado = false;
    GetStorage().remove('usuario');

    Get.offNamedUntil('/login', (route) => false);
  }

  void eliminarMascota() {
    Get.delete<MascotaController>();
  }

  void seleccionarMascota(MascotaModel mascotaModel) {
    var mascota = mascotaModel.toJson();
    GetStorage().write('mascota', mascota);
  }

  CategoriaProvider categoriaProvider = CategoriaProvider();
  AnimalsProvider animalsProvider = AnimalsProvider();

  Future<List<CategoriaModel>> listAllCategories() async {
    List<CategoriaModel> categorias =
        await categoriaProvider.getListarCategoria();
    var lista = categorias.toList();
    //GetStorage().write('categorias', lista);
    return categorias;
  }

  List<MascotaModel> mascotas = [];
  List<MascotaModel> mascotasAux = [];
  String idRazaValue = "";

  listAllAnimals() async {
    mascotas = await animalsProvider.getListarMascotas();
    mascotasAux = mascotas;
    //GetStorage().write('categorias', lista);
    //changedRaza(idRazaValue);
  }

  changeCategoria(String idCategoria) {
    mascotas = mascotasAux;
    mascotas = mascotas
        .where((element) => element.idCategoria == idCategoria)
        .toList();
  }

  changedRaza(String idRaza) {
    mascotas = mascotasAux;
    mascotas = mascotas.where((element) => element.idRaza == idRaza).toList();
  }
}
