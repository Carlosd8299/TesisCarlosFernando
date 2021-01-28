import 'dart:convert';

ProveedorAplicoOferta proveedorAplicoOfertaFromJson(String str) =>
    ProveedorAplicoOferta.fromJson(json.decode(str));

String proveedorAplicoOfertaToJson(ProveedorAplicoOferta data) =>
    json.encode(data.toJson());

class ProveedorAplicoOferta {
  ProveedorAplicoOferta({
    this.data,
  });

  List<ProveedorOferta> data;

  factory ProveedorAplicoOferta.fromJson(Map<String, dynamic> json) =>
      ProveedorAplicoOferta(
        data: List<ProveedorOferta>.from(
            json["data"].map((x) => ProveedorOferta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProveedorOferta {
  ProveedorOferta(
      {this.nombreProveedor, this.fecha, this.profileImage, this.idTercero});
  int idTercero;
  String nombreProveedor;
  String fecha;
  String profileImage;

  factory ProveedorOferta.fromJson(Map<String, dynamic> json) =>
      ProveedorOferta(
        nombreProveedor: json["nombre_tercero"],
        fecha: json["fecha"],
        profileImage: json["profileImage"],
        idTercero: json["id_tercero"],
      );

  Map<String, dynamic> toJson() => {
        "nombre_tercero": nombreProveedor,
        "fecha": fecha,
        "profileImage": profileImage,
        "id_tercero": idTercero
      };
}
