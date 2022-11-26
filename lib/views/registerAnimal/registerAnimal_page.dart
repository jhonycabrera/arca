import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:proyecto_veterinaria_arca/models/Color.dart';
import 'package:proyecto_veterinaria_arca/models/Raza.dart';
import 'package:proyecto_veterinaria_arca/views/registerAnimal/registerAnimal_controller.dart';

import '../../models/Categoria.dart';
import '../../widgets/dropdown_button2.dart';
import '../home/home_controller.dart';
import '../register/register_controller.dart';

class RegisterAnimalPage extends StatefulWidget {
  const RegisterAnimalPage({super.key});

  @override
  State<RegisterAnimalPage> createState() => _RegisterAnimalPageState();
}

class _RegisterAnimalPageState extends State<RegisterAnimalPage> {
  int _valueTipo = 0;
  int _valueTamano = 0;
  int _valueGenero = 0;

  RegisterController controller = Get.put(RegisterController());
  RegisterAnimalController registerAnimalController =
      Get.put(RegisterAnimalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E8F1),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            width: 130,
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[200],
            ),
            child: SingleChildScrollView(
              child: Container(
                //width: double.infinity,
                margin: const EdgeInsets.fromLTRB(40, 80, 40, 10),
                padding: const EdgeInsets.symmetric(vertical: 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _addImagen1(context),
                        _addImagen2(context),
                        _addImagen3(context),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    _textFieldCategoria(),
                    const SizedBox(height: 20.0),
                    _textFieldNombre(),
                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _valueTipo = 0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _valueTipo == 0
                                    ? Color(0xFF8D86C9)
                                    : Colors.white,
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            width: 130,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.dog,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Perro',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => _valueTipo = 1),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _valueTipo == 1
                                    ? Color(0xFF8D86C9)
                                    : Colors.white,
                                border: Border.all(color: Colors.white)),
                            width: 130,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.cat,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Gato',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),*/
                    const SizedBox(height: 30.0),
                    _textFieldRaza(),
                    const SizedBox(height: 30.0),
                    _textFieldColor(),
                    const SizedBox(height: 30.0),
                    _textFieldEdad(),
                    const SizedBox(height: 30.0),
                    _textFieldVacunas(),
                    const SizedBox(height: 30.0),
                    _textFieldTamano(),
                    const SizedBox(height: 30.0),
                    _textFieldSexo(),
                    const SizedBox(height: 30.0),
                    _textFieldEsterilizado(),
                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _valueTamano = 0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _valueTamano == 0
                                    ? Color(0xFF8D86C9)
                                    : Colors.white,
                                border: Border.all(color: Colors.white)),
                            width: 60,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'Grande',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => _valueTamano = 1),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _valueTamano == 1
                                    ? Color(0xFF8D86C9)
                                    : Colors.white,
                                border: Border.all(color: Colors.white)),
                            width: 60,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'Pequeño',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => _valueTamano = 2),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _valueTamano == 2
                                    ? Color(0xFF8D86C9)
                                    : Colors.white,
                                border: Border.all(color: Colors.white)),
                            width: 60,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'Mediano',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),*/
                    const SizedBox(height: 30.0),
                    /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _valueGenero = 0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _valueGenero == 0
                                    ? Color(0xFF8D86C9)
                                    : Colors.white,
                                border: Border.all(color: Colors.white)),
                            width: 130,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.mars,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Macho',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => _valueGenero = 1),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: _valueGenero == 1
                                    ? Color(0xFF8D86C9)
                                    : Colors.white,
                                border: Border.all(color: Colors.white)),
                            width: 130,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.venus,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Hembra',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),*/
                    const SizedBox(height: 30.0),
                    Obx(
                      () => registerAnimalController.isLoading.isTrue
                          ? Container(
                              color: Colors.white60,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Container(),
                    ),
                    _buttonRegistrar(),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
          _buttonBack(),
        ],
      ),
    );
  }
}

Widget _textFieldTamano() {
  RegisterAnimalController con = Get.put(RegisterAnimalController());

  return DropdownButtonFormField2(
    key: con.keyTamano,
    focusColor: Colors.white,
    selectedItemHighlightColor: Colors.white,
    decoration: InputDecoration(
      //Add isDense true and zero Padding.
      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
      isDense: true,
      contentPadding: EdgeInsets.zero,
      filled: true,
      hoverColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedErrorBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15),
      ),
      focusColor: Colors.red,
      fillColor: Colors.white,
      //Add more decoration as you want here
      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
    ),
    isExpanded: true,
    hint: const Text(
      'Selecciona el Tamaño',
      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3A4F83)),
    ),
    icon: const Icon(
      Icons.arrow_drop_down,
      color: Colors.black45,
    ),
    iconSize: 30,
    buttonHeight: 60,
    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
    dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: Color(0XFFF0F0F0)),
    items: con.tamanoItems
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return 'Por favor selecciona el Tamaño';
      }
    },
    onChanged: (value) {
      con.tamano = value as String;
      con.tamanoController.text = value as String;
    },
    onSaved: (value) {
      con.tamano = value as String;

      con.tamanoController.text = value as String;
    },
  );
}

Widget _textFieldCategoria() {
  RegisterAnimalController con = Get.put(RegisterAnimalController());
  HomeController homeController = Get.put(HomeController());

  return FutureBuilder(
    future: homeController.listAllCategories(),
    builder: (BuildContext context, AsyncSnapshot snap) {
      if (snap.hasData) {
        List<CategoriaModel> listacategoria = snap.data;
        return DropdownButtonFormField2(
          key: con.keyCategoria,
          focusColor: Colors.white,
          //value: con.color.isNotEmpty ? con.sexo : "MACHO",
          selectedItemHighlightColor: Colors.white,
          decoration: InputDecoration(
            //Add isDense true and zero Padding.
            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            isDense: true,
            contentPadding: EdgeInsets.zero,
            filled: true,
            hoverColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedErrorBorder: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(15),
            ),
            focusColor: Colors.red,
            fillColor: Colors.white,
            //Add more decoration as you want here
            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
          ),
          isExpanded: true,
          hint: const Text(
            'Selecciona la Categoria',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFF3A4F83)),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 30,
          buttonHeight: 60,
          buttonPadding: const EdgeInsets.only(left: 20, right: 10),
          dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0XFFF0F0F0)),
          items: listacategoria
              .map((item) => DropdownMenuItem<String>(
                    value: item.idCategoria,
                    child: Text(
                      item.descripcion,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Por favor selecciona la categoria';
            }
          },
          onChanged: (value) {
            con.categoria = value as String;
            con.categoriaController.text = value as String;
          },
          onSaved: (value) {
            con.categoria = value as String;

            con.categoriaController.text = value as String;
          },
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

Widget _textFieldColor() {
  RegisterAnimalController con = Get.put(RegisterAnimalController());

  return FutureBuilder(
      future: con.listAllColor(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<ColorModel> colores = snap.data;
          return DropdownButtonFormField2(
            key: con.keyColor,
            focusColor: Colors.white,
            //value: con.color.isNotEmpty ? con.sexo : "MACHO",
            selectedItemHighlightColor: Colors.white,
            decoration: InputDecoration(
              //Add isDense true and zero Padding.
              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
              isDense: true,
              contentPadding: EdgeInsets.zero,
              filled: true,
              hoverColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              focusColor: Colors.red,
              fillColor: Colors.white,
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: const Text(
              'Selecciona el Color',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF3A4F83)),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 60,
            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0XFFF0F0F0)),
            items: colores
                .map((item) => DropdownMenuItem<String>(
                      value: item.idColor,
                      child: Text(
                        item.descripcion,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Por favor selecciona el color';
              }
            },
            onChanged: (value) {
              con.color = value as String;
              con.colorController.text = value as String;
            },
            onSaved: (value) {
              con.color = value as String;

              con.colorController.text = value as String;
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}

Widget _textFieldEsterilizado() {
  RegisterAnimalController con = Get.put(RegisterAnimalController());

  return DropdownButtonFormField2(
    key: con.keyEsterilizado,
    focusColor: Colors.white,
    selectedItemHighlightColor: Colors.white,
    decoration: InputDecoration(
      //Add isDense true and zero Padding.
      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
      isDense: true,
      contentPadding: EdgeInsets.zero,
      filled: true,
      hoverColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedErrorBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15),
      ),
      focusColor: Colors.red,
      fillColor: Colors.white,
      //Add more decoration as you want here
      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
    ),
    isExpanded: true,
    hint: const Text(
      'Selecciona si esta Esterilizado',
      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3A4F83)),
    ),
    icon: const Icon(
      Icons.arrow_drop_down,
      color: Colors.black45,
    ),
    iconSize: 30,
    buttonHeight: 60,
    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
    dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: Color(0XFFF0F0F0)),
    items: con.esterilizadoItems
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return 'Por favor selecciona la opcion';
      }
    },
    onChanged: (value) {
      con.esterilizadoController.text = value as String;
    },
    onSaved: (value) {
      con.esterilizadoController.text = value as String;
    },
  );
}

Widget _textFieldSexo() {
  RegisterAnimalController con = Get.put(RegisterAnimalController());

  return DropdownButtonFormField2(
    key: con.keySexo,
    focusColor: Colors.white,
    selectedItemHighlightColor: Colors.white,
    decoration: InputDecoration(
      //Add isDense true and zero Padding.
      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
      isDense: true,
      contentPadding: EdgeInsets.zero,
      filled: true,
      hoverColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedErrorBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(15),
      ),
      focusColor: Colors.red,
      fillColor: Colors.white,
      //Add more decoration as you want here
      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
    ),
    isExpanded: true,
    hint: const Text(
      'Selecciona el Sexo',
      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3A4F83)),
    ),
    icon: const Icon(
      Icons.arrow_drop_down,
      color: Colors.black45,
    ),
    iconSize: 30,
    buttonHeight: 60,
    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
    dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: Color(0XFFF0F0F0)),
    items: con.sexItems
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return 'Por favor selecciona el sexo';
      }
    },
    onChanged: (value) {
      con.sexo = value as String;
      con.sexoController.text = value as String;
    },
    onSaved: (value) {
      con.sexo = value as String;

      con.sexoController.text = value as String;
    },
  );
}

Widget _buttonBack() {
  return SafeArea(
    child: Container(
      //width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: const EdgeInsets.symmetric(
          vertical: 8), //onst EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          //size: 30,
        ),
      ),
    ),
  );
}

Widget _addImagen1(BuildContext context) {
  RegisterAnimalController controller = Get.put(RegisterAnimalController());
  return InkWell(
    onTap: () {
      controller.showAlertDialog(context);
    },
    child: Obx(() => controller.load.isFalse
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFF3A4F83),
                )),
            width: 50,
            height: 50,
            child: Icon(
              Icons.add_a_photo,
              color: Color(0xFF3A4F83),
            ),
          )
        : CircleAvatar(
            backgroundColor: Colors.black,
            radius: 40.0,
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
              child: ClipOval(child: Image.file(controller.imageFile!)),
            ),
          )),
  );
}

Widget _addImagen2(BuildContext context) {
  RegisterAnimalController controller = Get.put(RegisterAnimalController());
  return InkWell(
    onTap: () {
      controller.showAlertDialog2(context);
    },
    child: Obx(() => controller.load2.isFalse
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFF3A4F83),
                )),
            width: 50,
            height: 50,
            child: Icon(
              Icons.add_a_photo,
              color: Color(0xFF3A4F83),
            ),
          )
        : CircleAvatar(
            backgroundColor: Colors.black,
            radius: 40.0,
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
              child: ClipOval(child: Image.file(controller.imageFile2!)),
            ),
          )),
  );
}

Widget _addImagen3(BuildContext context) {
  RegisterAnimalController controller = Get.put(RegisterAnimalController());
  return InkWell(
    onTap: () {
      controller.showAlertDialog3(context);
    },
    child: Obx(() => controller.load3.isFalse
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFF3A4F83),
                )),
            width: 50,
            height: 50,
            child: Icon(
              Icons.add_a_photo,
              color: Color(0xFF3A4F83),
            ),
          )
        : CircleAvatar(
            backgroundColor: Colors.black,
            radius: 40.0,
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
              child: ClipOval(child: Image.file(controller.imageFile3!)),
            ),
          )),
  );
}

Widget _textFieldNombre() {
  RegisterAnimalController con = Get.put(RegisterAnimalController());
  return TextField(
    keyboardType: TextInputType.text,
    controller: con.nombreController,
    decoration: InputDecoration(
      labelText: 'NOMBRE',
      labelStyle: const TextStyle(
        color: Color(0xFF3A4F83),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingresar nombre',
      hintStyle: const TextStyle(
        color: Color(0xFFC5C1BE),
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
    ),
    cursorColor: Colors.black,
  );
}

Widget _textFieldRaza() {
  RegisterAnimalController con = Get.put(RegisterAnimalController());

  return FutureBuilder(
      future: con.listAllRazas(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<RazaModel> razas = snap.data;
          return DropdownButtonFormField2(
            key: con.keyRaza,
            focusColor: Colors.white,
            //value: con.color.isNotEmpty ? con.sexo : "MACHO",
            selectedItemHighlightColor: Colors.white,
            decoration: InputDecoration(
              //Add isDense true and zero Padding.
              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
              isDense: true,
              contentPadding: EdgeInsets.zero,
              filled: true,
              hoverColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              focusColor: Colors.red,
              fillColor: Colors.white,
              //Add more decoration as you want here
              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
            ),
            isExpanded: true,
            hint: const Text(
              'Selecciona la Raza',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF3A4F83)),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 60,
            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0XFFF0F0F0)),
            items: razas
                .map((item) => DropdownMenuItem<String>(
                      value: item.idRaza,
                      child: Text(
                        item.nombre,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Por favor selecciona la raza';
              }
            },
            onChanged: (value) {
              con.raza = value as String;
              con.razaController.text = value as String;
            },
            onSaved: (value) {
              con.color = value as String;

              con.razaController.text = value as String;
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}

Widget _textFieldVacunas() {
  RegisterAnimalController con = Get.put(RegisterAnimalController());
  return TextField(
    keyboardType: TextInputType.text,
    controller: con.vacunaController,
    decoration: InputDecoration(
      labelText: 'VACUNAS',
      labelStyle: const TextStyle(
        color: Color(0xFF3A4F83),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingresar el numero de vacunas',
      hintStyle: const TextStyle(
        color: Color(0xFFC5C1BE),
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
    ),
    cursorColor: Colors.black,
  );
}

Widget _textFieldEdad() {
  RegisterAnimalController con = Get.put(RegisterAnimalController());
  return TextField(
    keyboardType: TextInputType.number,
    controller: con.edadController,
    decoration: InputDecoration(
      labelText: 'EDAD',
      labelStyle: const TextStyle(
        color: Color(0xFF3A4F83),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingresar edad',
      hintStyle: const TextStyle(
        color: Color(0xFFC5C1BE),
      ),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
    ),
    cursorColor: Colors.black,
  );
}

Widget _buttonRegistrar() {
  RegisterAnimalController controller = Get.put(RegisterAnimalController());
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFF567CB5),
      shadowColor: Color(0xFF3A4F83),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      minimumSize: Size(200, 40),
    ),
    child: const Text(
      'Registrar',
      style: TextStyle(fontSize: 18),
    ),
    onPressed: () {
      controller.postRegistrarAdopcionAnimal();
    },
  );
}
