class RazaModel {
  RazaModel({
    required this.idRaza,
    required this.nombre,
    required this.descripcion,
    required this.origen,
    required this.usuarioCreacion,
    this.fechaCracion,
    required this.estado,
    required this.nombres,
    required this.apellidos,
  });

  String idRaza;
  String nombre;
  String descripcion;
  String origen;
  String usuarioCreacion;
  DateTime? fechaCracion;
  String estado;
  String nombres;
  String apellidos;

  factory RazaModel.fromJson(Map<String, dynamic> json) => RazaModel(
    idRaza: json["IdRaza"],
    nombre: json["Nombre"],
    descripcion: json["Descripcion"],
    origen: json["Origen"],
    usuarioCreacion: json["UsuarioCreacion"],
    fechaCracion: DateTime.parse(json["FechaCracion"]),
    estado: json["Estado"],
    nombres: json["Nombres"],
    apellidos: json["Apellidos"],
  );

  Map<String, dynamic> toJson() => {
    "IdRaza": idRaza,
    "Nombre": nombre,
    "Descripcion": descripcion,
    "Origen": origen,
    "UsuarioCreacion": usuarioCreacion,
    "FechaCracion": fechaCracion!.toIso8601String(),
    "Estado": estado,
    "Nombres": nombres,
    "Apellidos": apellidos,
  };
}
