import 'package:meta/meta.dart' show required;

class RequestToken {
  RequestToken({
    @required this.token,
    @required this.usuario,
    @required this.fechaExpira,
  });

  final String token;
  final Usuario usuario;
  final String fechaExpira;

  factory RequestToken.fromJson(Map<String, dynamic> json) => RequestToken(
        token: json["token"],
        usuario: Usuario.fromJson(json["usuario"]),
        fechaExpira: json["fechaExpira"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "usuario": usuario.toJson(),
        "fechaExpira": fechaExpira,
      };
  getToken() => token;
}

class Usuario {
  Usuario({
    @required this.id,
    @required this.idTercero,
    @required this.idTipoUsuario,
    @required this.tipoUsuario,
    @required this.email,
    @required this.nombre,
    @required this.dni,
    @required this.telefono,
    @required this.estado,
    @required this.profileImage,
  });

  final int id;
  final int idTercero;
  final int idTipoUsuario;
  final String tipoUsuario;
  final String email;
  final String nombre;
  final String dni;
  final String telefono;
  final int estado;
  final String profileImage;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json["id"],
      idTercero: json["id_tercero"],
      idTipoUsuario: json["id_tipo_usuario"],
      tipoUsuario: json["tipo_usuario"],
      email: json["email"],
      nombre: json["nombre"],
      dni: json["dni"],
      telefono: json["telefono"],
      estado: json["estado"],
      profileImage: json["profileImage"].trim());

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tercero": idTercero,
        "id_tipo_usuario": idTipoUsuario,
        "tipo_usuario": tipoUsuario,
        "email": email,
        "nombre": nombre,
        "dni": dni,
        "telefono": telefono,
        "estado": estado,
        "profileImage": profileImage
      };
}
