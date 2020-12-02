import 'package:flutter/material.dart';

class Cupon {
  Cupon({
    @required this.idTercero,
    @required this.idServicio,
    @required this.fechaInicio,
    @required this.fechaFin,
    @required this.titulo,
    @required this.descripcion,
    @required this.precioNormal,
    @required this.precioDescuento,
    @required this.porcentajeDescuento,
    @required this.estado,
  });

  final int idTercero;
  final int idServicio;
  final String fechaInicio;
  final String fechaFin;
  final String titulo;
  final String descripcion;
  final int precioNormal;
  final int precioDescuento;
  final int porcentajeDescuento;
  final int estado;

  factory Cupon.fromJson(Map<String, dynamic> json) => Cupon(
        idTercero: json["id_tercero"],
        idServicio: json["id_servicio"],
        fechaInicio: json["fecha_inicio"],
        fechaFin: json["fecha_fin"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        precioNormal: json["precio_normal"],
        precioDescuento: json["precio_descuento"],
        porcentajeDescuento: json["porcentaje_descuento"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_tercero": idTercero,
        "id_servicio": idServicio,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
        "titulo": titulo,
        "descripcion": descripcion,
        "precio_normal": precioNormal,
        "precio_descuento": precioDescuento,
        "porcentaje_descuento": porcentajeDescuento,
        "estado": estado,
      };
}
