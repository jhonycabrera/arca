import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  String? id;
  String? dni;
  String? nombres;
  String? apellidos;
  String? telefono;
  String? correo;
  String? contrasea;
  String? imagen;

  Usuario({
    this.id,
    this.dni,
    this.nombres,
    this.apellidos,
    this.telefono,
    this.correo,
    this.contrasea,
    this.imagen,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"].toString(),
        dni: json["dni"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        telefono: json["telefono"],
        correo: json["correo"],
        contrasea: json["contraseña"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dni": dni,
        "nombres": nombres,
        "apellidos": apellidos,
        "telefono": telefono,
        "correo": correo,
        "contraseña": contrasea,
        "imagen": imagen,
      };
}
