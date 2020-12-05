import 'package:flutter/material.dart';

class TrabajoRealizado {
  TrabajoRealizado({
    @required this.idCategoria,
    @required this.nombreCategoria,
    @required this.descripcion,
    @required this.nombreTrabajo,
    @required this.fechaInicio,
    @required this.fechaFin,
    @required this.estado,
  });

  final int idCategoria;
  final String nombreCategoria;
  final String descripcion;
  final String nombreTrabajo;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final int estado;

  factory TrabajoRealizado.fromJson(Map<String, dynamic> json) =>
      TrabajoRealizado(
        idCategoria: json["id_categoria"],
        nombreCategoria: json["nombre_categoria"],
        descripcion: json["descripcion"],
        nombreTrabajo: json["nombre_trabajo"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_categoria": idCategoria,
        "nombre_categoria": nombreCategoria,
        "descripcion": descripcion,
        "nombre_trabajo": nombreTrabajo,
        "fecha_inicio": fechaInicio.toIso8601String(),
        "fecha_fin": fechaFin.toIso8601String(),
        "estado": estado,
      };
}
