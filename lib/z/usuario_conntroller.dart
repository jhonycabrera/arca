import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/UsuarioLogin.dart';

class UsuarioController extends GetxController {
  UsuarioModel usuario =
      UsuarioModel.fromJson(GetStorage().read('usuario') ?? {});
}
