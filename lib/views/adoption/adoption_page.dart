import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdoptionPage extends StatefulWidget {
  const AdoptionPage({super.key});

  @override
  State<AdoptionPage> createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {
  late File imagen;
  final picker = ImagePicker();
  Future selImagen(op) async {
    var pickedFile;

    if (op == 1) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print('No ha seleccionado ninguna foto');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //para que el teclado no tape el campo
      child: Column(
        children: [
          Text("."),
          Text("Añadir foto"),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: _inputDate()),
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: _inputDate()),
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: _inputDate()),
            ],
          ),
          Text(
              "Las fotos deben describir el animal para ayudar a identificaarlo"),
          const SizedBox(
            height: 10,
          ),
          Text("Título"),
          const SizedBox(
            height: 10,
          ),
          _inputTitulo(),
          SizedBox(
            height: 20,
          ),
          Text("Tipo de Animal"),
          const SizedBox(
            height: 10,
          ),
          _inputTipo(),
          SizedBox(
            height: 20,
          ),
          Text("Raza"),
          const SizedBox(
            height: 10,
          ),
          _inputRaza(),
          SizedBox(
            height: 20,
          ),
          Text("Sexo"),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: _inputSexo1()),
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: _inputSexo2()),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Apariencia"),
          const SizedBox(
            height: 10,
          ),
          _inputApariencia(),
          SizedBox(
            height: 20,
          ),
          Text("Identificación"),
          const SizedBox(
            height: 10,
          ),
          _inputIdentificacion(),
          SizedBox(
            height: 20,
          ),
          Text("¿En que zona se da en adopción"),
          _inputZona(),
          SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Añade una descripción"),
          _inputDescripcion(),
          SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Telefono de contacto"),
          _inputTelefono(),
          SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(
                  onPressed: () {}, child: Text("Publicar mascota")))
        ],
      ),
    );
  }

  Container _inputDate() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(0),
                          content: SingleChildScrollView(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    selImagen(1);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1, color: Colors.grey))),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Tomar una foto',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selImagen(1);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Seleccionar una foto',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        Icon(
                                          Icons.image,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pop(); //regresar y cancelar accion
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text('Cancelar',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                  imagen == null ? Center() : Image.file(imagen);
                })
          ],
        ));
  }

  Container _inputTitulo() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          keyboardType: TextInputType.datetime,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: "Introduce un titulo breve", border: InputBorder.none),
        ));
  }

  Container _inputTipo() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          Text("Añade una descripción")
        ],
      ),
    );
  }

  Container _inputRaza() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: "Introduce una raza", border: InputBorder.none),
        ));
  }

  Container _inputSexo1() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Femenino"),
          IconButton(
              icon: Icon(Icons.female_outlined, color: Colors.pink),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }

  Container _inputSexo2() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Masculino"),
          IconButton(
              icon: Icon(
                Icons.male_outlined,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }

  Container _inputApariencia() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: "Introduce un titulo breve", border: InputBorder.none),
        ));
  }

  Container _inputIdentificacion() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: "Introduce un titulo breve", border: InputBorder.none),
        ));
  }

  Container _inputZona() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: "Introduce un titulo breve", border: InputBorder.none),
        ));
  }

  Container _inputDescripcion() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: "Introduce un titulo breve", border: InputBorder.none),
        ));
  }

  Container _inputTelefono() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              hintText: "Introduce un titulo breve", border: InputBorder.none),
        ));
  }
}
