import 'dart:convert';

Categorias categoriasFromJson(String str) => Categorias.fromJson(json.decode(str));

String categoriasToJson(Categorias data) => json.encode(data.toJson());

class Categorias {
  Categorias({
    this.data,
  });

  List<Categoria> data;

  factory Categorias.fromJson(Map<String, dynamic> json) => Categorias(
    data: List<Categoria>.from(json["data"].map((x) => Categoria.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Categoria {
  Categoria({
    this.id,
    this.nombre,
    this.estado,
  });

  int id;
  String nombre;
  int estado;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
    id: json["id"],
    nombre: json["nombre"],
    estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "estado": estado,
  };
}