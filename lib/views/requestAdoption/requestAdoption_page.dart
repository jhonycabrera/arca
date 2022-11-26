import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:proyecto_veterinaria_arca/views/requestAdoption/requestAdoption_controller.dart';

import '../../models/Solicitud.dart';
import '../../z/usuario_conntroller.dart';
import '../home/mascota_controller.dart';

class RequestAdoption extends StatefulWidget {
  const RequestAdoption({Key? key}) : super(key: key);

  @override
  State<RequestAdoption> createState() => _RequestAdoptionState();
}

class _RequestAdoptionState extends State<RequestAdoption> {
  UsuarioController usuarioController = Get.put(UsuarioController());
  MascotaController conMascota = Get.put(MascotaController());
  RequestAdoptionController requestAdoptionController =
      Get.put(RequestAdoptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(40, 50, 40, 00),
              padding: const EdgeInsets.symmetric(vertical: 0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "Registro de Adopcion",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Nombres y Apellidos:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Text(
                          "${usuarioController.usuario.nombres} ${usuarioController.usuario.apellidos} ")),
                  SizedBox(
                    height: 10,
                  ),
                  Text("N° Documento de Identidad:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(
                    height: 5,
                  ),
                  Center(child: Text("${usuarioController.usuario.docNumero}")),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Telefono:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(
                    height: 5,
                  ),
                  Center(child: Text("${usuarioController.usuario.telefono}")),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Email:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(
                    height: 5,
                  ),
                  Center(child: Text("${usuarioController.usuario.email}")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Para continuar con el proceso debe subir la siguiente informacion:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "- DNI Escaneado",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "- Recibo de luz, agua o servicio que sirva de comprobanate de dirección actual.",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      requestAdoptionController.Seleccionar();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Subir documentos",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "- Documento Seleccionado",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Obx(() => requestAdoptionController.load.isFalse
                      ? Text("")
                      : Text(requestAdoptionController.name)),
                ],
              ),
            ),
          ),
          _buttonBack(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF3D4E80),
                shadowColor: Color(0xFF3D4E80),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(200, 40),
              ),
              child: const Text(
                'Guardar Informacion',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                requestAdoptionController.postRegistrarSolicitud(
                    int.parse(usuarioController.usuario.idUsuario!),
                    int.parse(conMascota.mascotaModel.idMascota));
              },
            ),
          ),
          Obx(
            () => requestAdoptionController.isLoading.isTrue
                ? Container(
                    color: Colors.white60,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

Widget _buttonBack() {
  return SafeArea(
    child: IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
  );
}
