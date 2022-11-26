class UsuarioRegisterModel {
  UsuarioRegisterModel({
    required this.docTipo,
    required this.docNumero,
    required this.apellidos,
    required this.nombres,
    required this.genero,
    required this.telefono,
    required this.fechaNacimiento,
    required this.email,
    required this.userName,
    required this.clave,
    required this.imagen,
    required this.idTipoRegistro,
  });

  String docTipo;
  String docNumero;
  String apellidos;
  String nombres;
  String genero;
  String telefono;
  String fechaNacimiento;
  String email;
  String userName;
  String clave;
  String imagen;
  int idTipoRegistro;

  factory UsuarioRegisterModel.fromJson(Map<String, dynamic> json) => UsuarioRegisterModel(
    docTipo: json["DocTipo"],
    docNumero: json["DocNumero"],
    apellidos: json["Apellidos"],
    nombres: json["Nombres"],
    genero: json["Genero"],
    telefono: json["Telefono"],
    fechaNacimiento: json["FechaNacimiento"],
    email: json["Email"],
    userName: json["UserName"],
    clave: json["Clave"],
    imagen: json["Imagen"],
    idTipoRegistro: json["IdTipoRegistro"],
  );

  Map<String, dynamic> toJson() => {
    "DocTipo": docTipo,
    "DocNumero": docNumero,
    "Apellidos": apellidos,
    "Nombres": nombres,
    "Genero": genero,
    "Telefono": telefono,
    "FechaNacimiento": fechaNacimiento,
    "Email": email,
    "UserName": userName,
    "Clave": clave,
    "Imagen": imagen,
    "IdTipoRegistro": idTipoRegistro,
  };
}
