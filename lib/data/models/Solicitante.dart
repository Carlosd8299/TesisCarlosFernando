import 'dart:convert';

Solicitante solicitanteFromJson(String str) => Solicitante.fromJson(json.decode(str));

String solicitanteToJson(Solicitante data) => json.encode(data.toJson());

class Solicitante {
  Solicitante({
    this.data,
  });

  List<Empresa> data;

  factory Solicitante.fromJson(Map<String, dynamic> json) => Solicitante(
    data: List<Empresa>.from(json["data"].map((x) => Empresa.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Empresa {
  Empresa({
    this.id,
    this.idTipoTercero,
    this.tipoTercero,
    this.idTipoDocumento,
    this.tipoDocumento,
    this.idRegimenTributario,
    this.regimenTributario,
    this.idActividadEconomica,
    this.actvidadEconomica,
    this.idCiudad,
    this.ciudad,
    this.dni,
    this.digito,
    this.nombreTercero,
    this.fechaRegistro,
    this.email,
    this.telefono,
    this.celular,
    this.direccion,
    this.tiempoExperiencia,
    this.estado,
    this.cantidadSeleccion,
    this.cantidadDirectas,
    this.cantidadProveedor,
  });

  int id;
  int idTipoTercero;
  String tipoTercero;
  int idTipoDocumento;
  String tipoDocumento;
  int idRegimenTributario;
  String regimenTributario;
  int idActividadEconomica;
  String actvidadEconomica;
  int idCiudad;
  String ciudad;
  String dni;
  dynamic digito;
  String nombreTercero;
  DateTime fechaRegistro;
  String email;
  String telefono;
  String celular;
  String direccion;
  int tiempoExperiencia;
  int estado;
  int cantidadSeleccion;
  int cantidadDirectas;
  int cantidadProveedor;

  factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
    id: json["id"],
    idTipoTercero: json["id_tipo_tercero"],
    tipoTercero: json["tipo_tercero"],
    idTipoDocumento: json["id_tipo_documento"],
    tipoDocumento: json["tipo_documento"],
    idRegimenTributario: json["id_regimen_tributario"],
    regimenTributario: json["regimen_tributario"],
    idActividadEconomica: json["id_actividad_economica"],
    actvidadEconomica: json["actvidad_economica"],
    idCiudad: json["id_ciudad"],
    ciudad: json["ciudad"],
    dni: json["dni"],
    digito: json["digito"],
    nombreTercero: json["nombre_tercero"],
    fechaRegistro: DateTime.parse(json["fecha_registro"]),
    email: json["email"],
    telefono: json["telefono"],
    celular: json["celular"],
    direccion: json["direccion"],
    tiempoExperiencia: json["tiempo_experiencia"],
    estado: json["estado"],
    cantidadSeleccion: json["cantidadSeleccion"],
    cantidadDirectas: json["cantidadDirectas"],
    cantidadProveedor: json["cantidadProveedor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_tipo_tercero": idTipoTercero,
    "tipo_tercero": tipoTercero,
    "id_tipo_documento": idTipoDocumento,
    "tipo_documento": tipoDocumento,
    "id_regimen_tributario": idRegimenTributario,
    "regimen_tributario": regimenTributario,
    "id_actividad_economica": idActividadEconomica,
    "actvidad_economica": actvidadEconomica,
    "id_ciudad": idCiudad,
    "ciudad": ciudad,
    "dni": dni,
    "digito": digito,
    "nombre_tercero": nombreTercero,
    "fecha_registro": fechaRegistro.toIso8601String(),
    "email": email,
    "telefono": telefono,
    "celular": celular,
    "direccion": direccion,
    "tiempo_experiencia": tiempoExperiencia,
    "estado": estado,
    "cantidadSeleccion": cantidadSeleccion,
    "cantidadDirectas": cantidadDirectas,
    "cantidadProveedor": cantidadProveedor,
  };
}