import 'dart:convert';

Servicios serviciosFromJson(String str) => Servicios.fromJson(json.decode(str));

String serviciosToJson(Servicios data) => json.encode(data.toJson());

class Servicios {
  Servicios({
    this.data,
  });

  List<Servicio> data;

  factory Servicios.fromJson(Map<String, dynamic> json) => Servicios(
    data: List<Servicio>.from(json["data"].map((x) => Servicio.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Servicio {
  Servicio({
    this.id,
    this.idCategoria,
    this.nombreCategoria,
    this.nombre,
    this.estado,
  });

  int id;
  int idCategoria;
  String nombreCategoria;
  String nombre;
  int estado;

  factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
    id: json["id"],
    idCategoria: json["id_categoria"],
    nombreCategoria: json["nombre_categoria"],
    nombre: json["nombre"],
    estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_categoria": idCategoria,
    "nombre_categoria": nombreCategoria,
    "nombre": nombre,
    "estado": estado,
  };
}