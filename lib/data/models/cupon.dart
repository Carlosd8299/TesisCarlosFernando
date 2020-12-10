// To parse this JSON data, do
//
//     final proveedor = proveedorFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Cupon {
  Cupon({
    @required this.id,
    @required this.idCategoria,
    @required this.nombreCategoria,
    @required this.idServicio,
    @required this.nombreServicio,
    @required this.titulo,
    @required this.fechaInicio,
    @required this.fechaFin,
    @required this.descripcion,
    @required this.precioNormal,
    @required this.precioDescuento,
    @required this.porcentajeDescuento,
    @required this.estado,
  });

  final int id;
  final int idCategoria;
  final String nombreCategoria;
  final int idServicio;
  final String nombreServicio;
  final String titulo;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final String descripcion;
  final int precioNormal;
  final int precioDescuento;
  final int porcentajeDescuento;
  final int estado;

  factory Cupon.fromJson(Map<String, dynamic> json) => Cupon(
        id: json["id"],
        idCategoria: json["id_categoria"],
        nombreCategoria: json["nombre_categoria"],
        idServicio: json["id_servicio"],
        nombreServicio: json["nombre_servicio"],
        titulo: json["titulo"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        descripcion: json["descripcion"],
        precioNormal: json["precio_normal"],
        precioDescuento: json["precio_descuento"],
        porcentajeDescuento: json["porcentaje_descuento"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_categoria": idCategoria,
        "nombre_categoria": nombreCategoria,
        "id_servicio": idServicio,
        "nombre_servicio": nombreServicio,
        "titulo": titulo,
        "fecha_inicio": fechaInicio.toIso8601String(),
        "fecha_fin": fechaFin.toIso8601String(),
        "descripcion": descripcion,
        "precio_normal": precioNormal,
        "precio_descuento": precioDescuento,
        "porcentaje_descuento": porcentajeDescuento,
        "estado": estado,
      };
}
