class CategoriaModel {
  CategoriaModel({
    required this.idCategoria,
    required this.descripcion,
    required this.nombres,
    required this.apellidos,
     this.fechaCreacion,
    required this.imagen,
  });

  String idCategoria;
  String descripcion;
  String nombres;
  String apellidos;
  DateTime? fechaCreacion;
  String imagen;

  factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
    idCategoria: json["IdCategoria"],
    descripcion: json["Descripcion"],
    nombres: json["Nombres"],
    apellidos: json["Apellidos"],
    fechaCreacion: DateTime.parse(json["FechaCreacion"]),
    imagen: json["Imagen"],
  );

  Map<String, dynamic> toJson() => {
    "IdCategoria": idCategoria,
    "Descripcion": descripcion,
    "Nombres": nombres,
    "Apellidos": apellidos,
    "FechaCreacion": fechaCreacion!.toIso8601String(),
    "Imagen": imagen,
  };
}