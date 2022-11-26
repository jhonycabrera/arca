import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../environment/db/db_arca.dart';
import '../../models/Mascota.dart';

class MascotaController extends GetxController {
  MascotaModel mascotaModel =
      MascotaModel.fromJson(GetStorage().read('mascota') ?? {});
  final checkboxValue = false.obs;

  @override
  void onInit() {
    if (mascotaModel.favorito == "true") {
      checkboxValue.value = true;
    } else {
      checkboxValue.value = false;
    }

    super.onInit();
  }

  void goToHomePage() {
    Get.toNamed('/home');
  }

  void actualizarMascota(MascotaModel mascotaModel) async {
    if (checkboxValue.isFalse) {
      await DBArca.db.updateIsFavouriteMascota(mascotaModel.idMascota);
      checkboxValue(!checkboxValue.value);
    } else {
      await DBArca.db.updateIsNotFavouriteMascota(mascotaModel.idMascota);
      checkboxValue(!checkboxValue.value);
    }
  }
}
