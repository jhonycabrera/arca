
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LogueadoController extends GetxController {

  final logueado = false.obs;

  logueadooNo(){
    logueado(!logueado.value);
  }

}