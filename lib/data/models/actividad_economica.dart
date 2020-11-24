import 'package:flutter/material.dart';

class ActividadEconomica {
  ActividadEconomica({
    @required this.data,
  });

  final List<ActividadEco> data;

  factory ActividadEconomica.fromJson(Map<String, dynamic> json) =>
      ActividadEconomica(
        data: List<ActividadEco>.from(
            json["data"].map((x) => ActividadEco.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ActividadEco {
  ActividadEco({
    @required this.id,
    @required this.codigo,
    @required this.nombre,
    @required this.estado,
  });

  final int id;
  final String codigo;
  final String nombre;
  final int estado;

  factory ActividadEco.fromJson(Map<String, dynamic> json) => ActividadEco(
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
