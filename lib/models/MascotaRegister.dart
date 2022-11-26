class MascotaRegisterModel {
  MascotaRegisterModel({
    required this.descripcion,
    required this.idCategoria,
    required this.edad,
    required this.genero,
    required this.idColor,
    required this.idRaza,
    required this.idUsuario,
    required this.imagen1,
    required this.imagen2,
    required this.imagen3,
    required this.vacunas,
    required this.tamanio,
    required this.esterelizado,
  });

  String descripcion;
  int idCategoria;
  int edad;
  String genero;
  int idColor;
  int idRaza;
  int idUsuario;
  String imagen1;
  String imagen2;
  String imagen3;
  String vacunas;
  String tamanio;
  bool esterelizado;

  factory MascotaRegisterModel.fromJson(Map<String, dynamic> json) => MascotaRegisterModel(
    descripcion: json["Descripcion"],
    idCategoria: json["IdCategoria"],
    edad: json["Edad"],
    genero: json["Genero"],
    idColor: json["IdColor"],
    idRaza: json["IdRaza"],
    idUsuario: json["IdUsuario"],
    imagen1: json["Imagen1"],
    imagen2: json["Imagen2"],
    imagen3: json["Imagen3"],
    vacunas: json["Vacunas"],
    tamanio: json["Tamanio"],
    esterelizado: json["Esterelizado"],
  );

  Map<String, dynamic> toJson() => {
    "Descripcion": descripcion,
    "IdCategoria": idCategoria,
    "Edad": edad,
    "Genero": genero,
    "IdColor": idColor,
    "IdRaza": idRaza,
    "IdUsuario": idUsuario,
    "Imagen1": imagen1,
    "Imagen2": imagen2,
    "Imagen3": imagen3,
    "Vacunas": vacunas,
    "Tamanio": tamanio,
    "Esterelizado": esterelizado,
  };
}
