import 'package:flutter/material.dart';

class RegimenTributario {
  RegimenTributario({
    @required this.lista,
  });

  final List<Regimen> lista;

  factory RegimenTributario.fromJson(Map<String, dynamic> json) =>
      RegimenTributario(
        lista: List<Regimen>.from(json["data"].map((x) => Regimen.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(lista.map((x) => x.toJson())),
      };
}

class Regimen {
  Regimen({
    @required this.id,
    @required this.codigo,
    @required this.nombre,
    @required this.estado,
  });

  final int id;
  final String codigo;
  final String nombre;
  final int estado;

  factory Regimen.fromJson(Map<String, dynamic> json) => Regimen(
        id: json["id"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "nombre": nombre,
        "estado": estado,
      };
}
