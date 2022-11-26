import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../widgets/dropdown_button2.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController con = Get.put(RegisterController());

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
                children: [
                  GestureDetector(
                    onTap: () {},
                    //=> con.showAlertDialog(context),
                    child: Stack(
                      children: [
                        Obx(
                          () => con.loadRegister.isFalse
                              ? Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade300,
                                    size: 80.0,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 53.0,
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                        child: Image.file(
                                      con.imageFileRegister!,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ),
                        ),
                        InkWell(
                          onTap: () {
                            con.showAlertDialogRegister(context);
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.grey.shade700,
                              size: 25.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _textFieldDni(),
                  SizedBox(height: 20.0),
                  _textFieldName(),
                  SizedBox(height: 20.0),
                  _textFieldLasName(),
                  SizedBox(height: 20.0),
                  _textFieldSexo(),
                  SizedBox(height: 20.0),
                  _textFieldFechaNacimiento(context),
                  SizedBox(height: 20.0),
                  _textFieldPhone(),
                  SizedBox(height: 20.0),
                  _textFieldEmail(),
                  SizedBox(height: 20.0),
                  _textFieldPassword(),
                  SizedBox(height: 20.0),
                  _textFieldConfiPassword(),
                  Row(
                    children: <Widget>[
                      Obx(() => Checkbox(
                          value: con.checkboxValue.value,
                          onChanged: (value) {
                            con.aceptarTerminosCondiciones();
                          })),
                      Text(
                        "Acepto todos los términos y condiciones.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Obx(() => con.isLoading.isTrue
                      ? Container(
                          color: Colors.white60,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container()),
                  ElevatedButton(
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
                      'Registrarse',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () => con.register(),
                  ),
                  SizedBox(height: 25.0),
                ],
              ),
            ),
          ),
          _buttonBack(),
        ],
      ),
    );
  }
}

Widget _textFieldSexo() {
  RegisterController con = Get.put(RegisterController());

  return DropdownButtonFormField2(
    key: con.keySexo,
    focusColor: Colors.white,
    value: con.sexo.isNotEmpty ? con.sexo : "MASCULINO",
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
      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4184F4)),
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
      con.generoController.text = value as String;
    },
    onSaved: (value) {
      con.sexo = value as String;

      con.generoController.text = value as String;
    },
  );
}

Widget _textFieldFechaNacimiento(BuildContext context) {
  RegisterController con = Get.put(RegisterController());
  return TextFormField(
    onTap: () async {
      DateTime? pickedDate = await showDatePicker(
          locale: const Locale("es", "ES"),
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFF4760FF),
                  // header background color
                  onPrimary: Colors.black,
                  // header text color
                  onSurface: Colors.black, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
          initialDate: DateTime.now(),
          firstDate: DateTime(1940),
          //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime(2100));

      if (pickedDate != null) {
        // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
        String formattedDate = DateFormat('yyyy/MM/dd').format(pickedDate);
        //   print(formattedDate); //formatted date output using intl package =>  2021-03-16
        con.fechaNacimientoController.text =
            formattedDate; //set output date to TextField value.

      } else {}
    },
    controller: con.fechaNacimientoController,
    readOnly: true,
    decoration: InputDecoration(
      labelText: 'Fecha de Nacimiento',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingrese su Fecha de Nacimiento',
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
  );
}

AlertDialog alartDialog(String title, String content, BuildContext context) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      TextButton(
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black38)),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );
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

Widget _textFieldDni() {
  RegisterController con = Get.put(RegisterController());
  return TextFormField(
    controller: con.dniController,
    keyboardType: TextInputType.number,
    maxLength: 8,
    decoration: InputDecoration(
      labelText: 'Dni',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingrese su DNI',
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
  );
}

Widget _textFieldName() {
  RegisterController con = Get.put(RegisterController());
  return TextFormField(
    controller: con.nameController,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: 'Nombres',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingrese su nombre',
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
  );
}

Widget _textFieldLasName() {
  RegisterController con = Get.put(RegisterController());
  return TextFormField(
    controller: con.lastnameController,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: 'Apellidos',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingrese su apellido',
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
  );
}

Widget _textFieldPhone() {
  RegisterController con = Get.put(RegisterController());
  return TextFormField(
    controller: con.phoneController,
    maxLength: 9,
    decoration: InputDecoration(
      labelText: 'Número de teléfono móvi',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingrese su número teléfonico móvil',
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
    keyboardType: TextInputType.phone,
    validator: (val) {
      if (!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)) {
        return "Introduce su número de teléfono válido";
      }
      return null;
    },
  );
}

Widget _textFieldEmail() {
  RegisterController con = Get.put(RegisterController());
  return TextFormField(
    controller: con.emailController,
    decoration: InputDecoration(
      labelText: 'Correo Electrónico',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingrese su correo electrónico',
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
    keyboardType: TextInputType.emailAddress,
    validator: (val) {
      if (!(val!.isEmpty) &&
          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
              .hasMatch(val)) {
        return "Introduzca una dirección de correo electrónico válida";
      }
      return null;
    },
  );
}

Widget _textFieldPassword() {
  RegisterController con = Get.put(RegisterController());
  return TextFormField(
    controller: con.passwordController,
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Clave',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Ingresa una contraseña',
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
    validator: (val) {
      if (val!.isEmpty) {
        return "Por favor, introduzca su contraseña";
      }
      return null;
    },
  );
}

Widget _textFieldConfiPassword() {
  RegisterController con = Get.put(RegisterController());
  return TextFormField(
    controller: con.confiPasswordController,
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Confirmar Clave',
      labelStyle: const TextStyle(
        color: Color(0xFF4184F4),
        fontWeight: FontWeight.bold,
      ),
      hintText: 'Repita la contraseña',
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
    validator: (val) {
      if (val!.isEmpty) {
        return "Por favor, introduzca su contraseña";
      }
      return null;
    },
  );
}
