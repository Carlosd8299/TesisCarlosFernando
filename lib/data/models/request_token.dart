import 'package:flutter/material.dart';

class RequestToken {
  RequestToken({
    @required this.token,
    @required this.isAuto,
    @required this.usuario,
  });

  final String token;
  final bool isAuto;
  final Usuario usuario;

  Usuario get getUsuario => usuario;

  factory RequestToken.fromJson(Map<String, dynamic> json) => RequestToken(
        token: json["token"],
        isAuto: json["isAuto"],
        usuario: Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "isAuto": isAuto,
        "usuario": usuario.toJson(),
      };
}

class Usuario {
  Usuario({
    @required this.id,
    @required this.idTipoUsuario,
    @required this.tipoUsuario,
    @required this.email,
    @required this.nombre,
    @required this.dni,
    @required this.telefono,
    @required this.estado,
  });

  final int id;
  final int idTipoUsuario;
  final String tipoUsuario;
  final String email;
  final String nombre;
  final String dni;
  final String telefono;
  final int estado;

  int get getidTipoUsuario => idTipoUsuario;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        idTipoUsuario: json["id_tipo_usuario"],
        tipoUsuario: json["tipo_usuario"],
        email: json["email"],
        nombre: json["nombre"],
        dni: json["dni"],
        telefono: json["telefono"],
        estado: json["estado"],
      );

  fromJson2(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        idTipoUsuario: json["id_tipo_usuario"],
        tipoUsuario: json["tipo_usuario"],
        email: json["email"],
        nombre: json["nombre"],
        dni: json["dni"],
        telefono: json["telefono"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tipo_usuario": idTipoUsuario,
        "tipo_usuario": tipoUsuario,
        "email": email,
        "nombre": nombre,
        "dni": dni,
        "telefono": telefono,
        "estado": estado,
      };
}
