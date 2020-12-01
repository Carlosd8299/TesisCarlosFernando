import 'dart:convert';

class SolicitudCategorias {
  SolicitudCategorias({
    this.data,
  });

  List<Datum> data;

  factory SolicitudCategorias.fromJson(Map<String, dynamic> json) => SolicitudCategorias(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
class Datum {
  Datum({
    this.id,
    this.categoria,
    this.cantidad,
  });

  int id;
  String categoria;
  int cantidad;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoria: json["categoria"],
    cantidad: json["cantidad"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoria": categoria,
    "cantidad": cantidad,
  };
}