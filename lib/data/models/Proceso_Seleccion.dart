import 'dart:convert';

ProcesosDeSeleccion solicitudesFromJson(String str) =>
    ProcesosDeSeleccion.fromJson(json.decode(str));

String solicitudesToJson(ProcesosDeSeleccion data) =>
    json.encode(data.toJson());

class ProcesosDeSeleccion {
  ProcesosDeSeleccion({
    this.data,
  });

  List<ProcesoSeleccion> data;

  factory ProcesosDeSeleccion.fromJson(Map<String, dynamic> json) =>
      ProcesosDeSeleccion(
        data: List<ProcesoSeleccion>.from(
            json["data"].map((x) => ProcesoSeleccion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProcesoSeleccion {
  ProcesoSeleccion({
    this.id,
    this.idServicio,
    this.nombreServicio,
    this.idTercero,
    this.nombreTercero,
    this.idCupon,
    this.cupon,
    this.idTipoSolicitud,
    this.tipoSolicitud,
    this.titulo,
    this.fechaSolicitud,
    this.fechaFin,
    this.fechaSeleccion,
    this.fechaFinSeleccion,
    this.presupuesto,
    this.descripcion,
    this.criterio,
    this.nombreEstado,
    this.estado,
  });

  int id;
  int idServicio;
  String nombreServicio;
  int idTercero;
  String nombreTercero;
  dynamic idCupon;
  String cupon;
  int idTipoSolicitud;
  String tipoSolicitud;
  String titulo;
  DateTime fechaSolicitud;
  DateTime fechaFin;
  DateTime fechaSeleccion;
  DateTime fechaFinSeleccion;
  int presupuesto;
  String descripcion;
  int estado;
  String criterio;
  String nombreEstado;

  factory ProcesoSeleccion.fromJson(Map<String, dynamic> json) =>
      ProcesoSeleccion(
        id: json["id"],
        idServicio: json["id_servicio"],
        nombreServicio: json["nombre_servicio"],
        idTercero: json["id_tercero"],
        nombreTercero: json["nombre_tercero"],
        idCupon: json["id_cupon"],
        cupon: json["cupon"],
        idTipoSolicitud: json["id_tipo_solicitud"],
        tipoSolicitud: json["tipo_solicitud"],
        titulo: json["titulo"],
        fechaSolicitud: DateTime.parse(json["fecha_solicitud"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        fechaSeleccion: DateTime.parse(json["fecha_seleccion"]),
        fechaFinSeleccion: DateTime.parse(json["fecha_fin_seleccion"]),
        presupuesto: json["presupuesto"],
        descripcion: json["descripcion"],
        criterio: json["criterio"],
        estado: json["estado"],
        nombreEstado: json["nombre_estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_servicio": idServicio,
        "nombre_servicio": nombreServicio,
        "id_tercero": idTercero,
        "nombre_tercero": nombreTercero,
        "id_cupon": idCupon,
        "cupon": cupon,
        "id_tipo_solicitud": idTipoSolicitud,
        "tipo_solicitud": tipoSolicitud,
        "titulo": titulo,
        "fecha_solicitud":
            "${fechaSolicitud.year.toString().padLeft(4, '0')}-${fechaSolicitud.month.toString().padLeft(2, '0')}-${fechaSolicitud.day.toString().padLeft(2, '0')}",
        "fecha_fin":
            "${fechaFin.year.toString().padLeft(4, '0')}-${fechaFin.month.toString().padLeft(2, '0')}-${fechaFin.day.toString().padLeft(2, '0')}",
        "fecha_seleccion":
            "${fechaSeleccion.year.toString().padLeft(4, '0')}-${fechaSeleccion.month.toString().padLeft(2, '0')}-${fechaSeleccion.day.toString().padLeft(2, '0')}",
        "fecha_fin_seleccion":
            "${fechaFinSeleccion.year.toString().padLeft(4, '0')}-${fechaFinSeleccion.month.toString().padLeft(2, '0')}-${fechaFinSeleccion.day.toString().padLeft(2, '0')}",
        "presupuesto": presupuesto,
        "descripcion": descripcion,
        "criterio": criterio,
        "nombre_estado": nombreEstado,
        "estado": estado,
      };
}
