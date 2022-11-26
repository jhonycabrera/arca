import 'dart:convert';

Animal animalFromJson(String str) => Animal.fromJson(json.decode(str));

String animalToJson(Animal data) => json.encode(data.toJson());

class Animal {
  String? id;
  String? idUsuario;
  String? image;
  String? nombre;
  String? tipo;
  String? raza;
  String? edad;
  String? tamano;
  String? sexo;

  Animal({
    this.id,
    this.idUsuario,
    this.image,
    this.nombre,
    this.tipo,
    this.raza,
    this.edad,
    this.tamano,
    this.sexo,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        id: json["id"],
        idUsuario: json["id_usuario"],
        image: json["image"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        raza: json["raza"],
        edad: json["edad"],
        tamano: json["tamaño"],
        sexo: json["sexo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_usuario": idUsuario,
        "image": image,
        "nombre": nombre,
        "tipo": tipo,
        "raza": raza,
        "edad": edad,
        "tamaño": tamano,
        "sexo": sexo,
      };
}
