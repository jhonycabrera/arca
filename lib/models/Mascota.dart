class MascotaModel {
  MascotaModel({
    required this.idMascota,
    required this.descripcion,
    required this.idCategoria,
    required this.edad,
    required this.imagen1,
    required this.estado,
    required this.flag,
    required this.idColor,
    required this.idRaza,
    required this.genero,
    required this.vacunas,
    required this.tamanio,
    required this.esterelizado,
    required this.imagen2,
    required this.imagen3,
    required this.categoria,
    required this.color,
    required this.raza,
    this.favorito,
    this.activo,
  });

  String idMascota;
  String descripcion;
  String idCategoria;
  String edad;
  String imagen1;
  String estado;
  String? activo;
  String flag;
  String idColor;
  String idRaza;
  String genero;
  String vacunas;
  String tamanio;
  String esterelizado;
  String imagen2;
  String imagen3;
  String categoria;
  String color;
  String raza;
  String? favorito;

  factory MascotaModel.fromJson(Map<String, dynamic> json) => MascotaModel(
    idMascota: json["IdMascota"],
    descripcion: json["Descripcion"],
    idCategoria: json["IdCategoria"],
    edad: json["Edad"],
    imagen1: json["Imagen1"],
    estado: json["Estado"],
    activo: json["Activo"] ?? "",
    flag: json["Flag"],
    idColor: json["IdColor"],
    idRaza: json["IdRaza"],
    genero: json["Genero"],
    vacunas: json["Vacunas"],
    tamanio: json["Tamanio"],
    esterelizado: json["Esterelizado"],
    imagen2: json["Imagen2"],
    imagen3: json["Imagen3"],
    categoria: json["Categoria"],
    color: json["Color"],
    raza: json["Raza"],
    favorito: json["Favorito"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "IdMascota": idMascota,
    "Descripcion": descripcion,
    "IdCategoria": idCategoria,
    "Edad": edad,
    "Imagen1": imagen1,
    "Estado": estado,
    "Activo": activo,
    "Flag": flag,
    "IdColor": idColor,
    "IdRaza": idRaza,
    "Genero": genero,
    "Vacunas": vacunas,
    "Tamanio": tamanio,
    "Esterelizado": esterelizado,
    "Imagen2": imagen2,
    "Imagen3": imagen3,
    "Categoria": categoria,
    "Color": color,
    "Raza": raza,
    "Favorito": favorito,
  };
}



/*class MascotaModel {
  MascotaModel({
    required this.idMascota,
    required this.descripcion,
    required this.idCategoria,
    required this.edad,
    required this.fechaCreacion,
    required this.usuarioCreacion,
    required this.imagen1,
    required this.estado,
    required this.flag,
    required this.idColor,
    required this.idRaza,
    required this.genero,
    required this.vacunas,
    required this.tamanio,
    required this.esterelizado,
    required this.imagen2,
    required this.imagen3,
    required this.categoria,
    required this.color,
    required this.raza,
  });

  String idMascota;
  String descripcion;
  String idCategoria;
  String edad;
  DateTime fechaCreacion;
  String usuarioCreacion;
  String imagen1;
  String estado;
  String flag;
  String idColor;
  String idRaza;
  String genero;
  String vacunas;
  String tamanio;
  String esterelizado;
  String imagen2;
  String imagen3;
  String categoria;
  String color;
  String raza;

  factory MascotaModel.fromJson(Map<String, dynamic> json) => MascotaModel(
    idMascota: json["IdMascota"],
    descripcion: json["Descripcion"],
    idCategoria: json["IdCategoria"],
    edad: json["Edad"],
    fechaCreacion: DateTime.parse(json["FechaCreacion"]),
    usuarioCreacion: json["UsuarioCreacion"],
    imagen1: json["Imagen1"],
    estado: json["Estado"],
    flag: json["Flag"],
    idColor: json["IdColor"],
    idRaza: json["IdRaza"],
    genero: json["Genero"],
    vacunas: json["Vacunas"],
    tamanio: json["Tamanio"],
    esterelizado: json["Esterelizado"],
    imagen2: json["Imagen2"],
    imagen3: json["Imagen3"],
    categoria: json["Categoria"],
    color: json["Color"],
    raza: json["Raza"],
  );

  Map<String, dynamic> toJson() => {
    "IdMascota": idMascota,
    "Descripcion": descripcion,
    "IdCategoria": idCategoria,
    "Edad": edad,
    "FechaCreacion": fechaCreacion.toIso8601String(),
    "UsuarioCreacion": usuarioCreacion,
    "Imagen1": imagen1,
    "Estado": estado,
    "Flag": flag,
    "IdColor": idColor,
    "IdRaza": idRaza,
    "Genero": genero,
    "Vacunas": vacunas,
    "Tamanio": tamanio,
    "Esterelizado": esterelizado,
    "Imagen2": imagen2,
    "Imagen3": imagen3,
    "Categoria": categoria,
    "Color": color,
    "Raza": raza,
  };
}

 */
