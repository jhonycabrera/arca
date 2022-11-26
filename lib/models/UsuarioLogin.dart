class UsuarioModel {
  UsuarioModel({
    this.idUsuario,
    this.email,
    this.imagen,
    this.idTipoRegistro,
    this.userName,
    this.idPersona,
    this.docTipo,
    this.docNumero,
    this.nombres,
    this.apellidos,
    this.genero,
    this.telefono,
    this.resultado,
    this.mensaje,
  });

  String? idUsuario;
  String? email;
  String? imagen;
  String? idTipoRegistro;
  String? userName;
  String? idPersona;
  String? docTipo;
  String? docNumero;
  String? nombres;
  String? apellidos;
  String? genero;
  String? telefono;
  String? resultado;
  String? mensaje;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
    idUsuario: json["IdUsuario"],
    email: json["Email"],
    imagen: json["Imagen"],
    idTipoRegistro: json["IdTipoRegistro"],
    userName: json["UserName"],
    idPersona: json["IdPersona"],
    docTipo: json["DocTipo"],
    docNumero: json["DocNumero"],
    nombres: json["Nombres"],
    apellidos: json["Apellidos"],
    genero: json["Genero"],
    telefono: json["Telefono"],
    resultado: json["resultado"],
    mensaje: json["mensaje"],
  );

  Map<String, dynamic> toJson() => {
    "IdUsuario": idUsuario,
    "Email": email,
    "Imagen": imagen,
    "IdTipoRegistro": idTipoRegistro,
    "UserName": userName,
    "IdPersona": idPersona,
    "DocTipo": docTipo,
    "DocNumero": docNumero,
    "Nombres": nombres,
    "Apellidos": apellidos,
    "Genero": genero,
    "Telefono": telefono,
    //"FechaNacimiento": "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
    "resultado": resultado,
    "mensaje": mensaje,
  };
}
