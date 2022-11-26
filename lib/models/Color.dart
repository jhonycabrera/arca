class ColorModel {
  ColorModel({
    required this.idColor,
    required this.nombre,
    required this.descripcion,
    required this.usuarioCreacion,
    required this.fechaCreacion,
    required this.estado,
    required this.nombres,
    required this.apellidos,
  });

  String idColor;
  String nombre;
  String descripcion;
  String usuarioCreacion;
  DateTime fechaCreacion;
  String estado;
  String nombres;
  String apellidos;

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
    idColor: json["IdColor"],
    nombre: json["Nombre"],
    descripcion: json["Descripcion"],
    usuarioCreacion: json["UsuarioCreacion"],
    fechaCreacion: DateTime.parse(json["FechaCreacion"]),
    estado: json["Estado"],
    nombres: json["Nombres"],
    apellidos: json["Apellidos"],
  );

  Map<String, dynamic> toJson() => {
    "IdColor": idColor,
    "Nombre": nombre,
    "Descripcion": descripcion,
    "UsuarioCreacion": usuarioCreacion,
    "FechaCreacion": fechaCreacion.toIso8601String(),
    "Estado": estado,
    "Nombres": nombres,
    "Apellidos": apellidos,
  };
}
