import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../environment/db/db_arca.dart';
import '../../models/Mascota.dart';

class InfoAnimalController extends GetxController {
  final checkboxValue = false.obs;
  final checkboxValue2 = false.obs;

  addOrNotFavorite() {
    checkboxValue.isTrue;
  }

  addOrNotFavorite2() {
    checkboxValue.isFalse;
  }

  void actualizarMascota(MascotaModel mascotaModel) async {
    if (mascotaModel.favorito == "false" || mascotaModel.favorito!.isEmpty) {
      await DBArca.db.updateIsFavouriteMascota(mascotaModel.idMascota);
      checkboxValue.isTrue;
    } else {
      await DBArca.db.updateIsNotFavouriteMascota(mascotaModel.idMascota);
      checkboxValue.isFalse;
    }

    var mascota = mascotaModel.toJson();
  }
}
