class SolicitudModel {
  SolicitudModel({
    required this.documento,
    required this.idUsuario,
    required this.idMascota,
  });

  String documento;
  int idUsuario;
  int idMascota;

  factory SolicitudModel.fromJson(Map<String, dynamic> json) => SolicitudModel(
    documento: json["Documento"],
    idUsuario: json["IdUsuario"],
    idMascota: json["IdMascota"],
  );

  Map<String, dynamic> toJson() => {
    "Documento": documento,
    "IdUsuario": idUsuario,
    "IdMascota": idMascota,
  };
}