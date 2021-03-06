import 'package:flutter/material.dart';

class TrabajoRealizado {
  TrabajoRealizado({
    @required this.idCategoria,
    @required this.nombreCategoria,
    @required this.idServicio,
    @required this.nombreServicio,
    @required this.descripcion,
    @required this.nombreTrabajo,
    @required this.empresa,
    @required this.fechaInicio,
    @required this.fechaFin,
    @required this.estado,
  });

  final int idCategoria;
  final String nombreCategoria;
  final int idServicio;
  final String nombreServicio;
  final String descripcion;
  final String nombreTrabajo;
  final String empresa;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final int estado;

  factory TrabajoRealizado.fromJson(Map<String, dynamic> json) =>
      TrabajoRealizado(
        idCategoria: json["id_categoria"],
        nombreCategoria: json["nombre_categoria"],
        idServicio: json["id_servicio"],
        nombreServicio: json["nombre_servicio"],
        descripcion: json["descripcion"],
        nombreTrabajo: json["nombre_trabajo"],
        empresa: json["empresa"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_categoria": idCategoria,
        "nombre_categoria": nombreCategoria,
        "id_servicio": idServicio,
        "nombre_servicio": nombreServicio,
        "descripcion": descripcion,
        "nombre_trabajo": nombreTrabajo,
        "empresa": empresa,
        "fecha_inicio": fechaInicio.toIso8601String(),
        "fecha_fin": fechaFin.toIso8601String(),
        "estado": estado,
      };
}
