class Ofertas {
  Ofertas({
    this.data,
  });

  List<Oferta> data;

  factory Ofertas.fromJson(Map<String, dynamic> json) => Ofertas(
        data: List<Oferta>.from(json["data"].map((x) => Oferta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Oferta {
  Oferta({
    this.idRespuesta,
    this.idSolicitud,
    this.idTercero,
    this.nombreTercero,
    this.fecha,
    this.titulo,
    this.descripcion,
    this.periodoPropuesto,
    this.fechaAprobacion,
    this.valor,
    this.estado,
    this.nombreEstado,
    this.profileImage,
    this.fecsys,
  });

  int idRespuesta;
  int idSolicitud;
  int idTercero;
  String nombreTercero;
  DateTime fecha;
  String titulo;
  String descripcion;
  int periodoPropuesto;
  dynamic fechaAprobacion;
  int valor;
  int estado;
  String profileImage;
  DateTime fecsys;
  String nombreEstado;

  factory Oferta.fromJson(Map<String, dynamic> json) => Oferta(
        idRespuesta: json["id_respuesta"],
        idSolicitud: json["id_solicitud"],
        idTercero: json["id_tercero"],
        nombreTercero: json["nombre_tercero"],
        fecha: DateTime.parse(json["fecha"]),
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        periodoPropuesto: json["periodo_propuesto"],
        fechaAprobacion: json["fecha_aprobacion"],
        valor: json["valor"],
        estado: json["estado"],
        profileImage: json["profileImage"],
        nombreEstado: json["nombre_estado"],
        fecsys: DateTime.parse(json["fecsys"]),
      );

  Map<String, dynamic> toJson() => {
        "id_respuesta": idRespuesta,
        "id_solicitud": idSolicitud,
        "id_tercero": idTercero,
        "nombre_tercero": nombreTercero,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "descripcion": descripcion,
        "periodo_propuesto": periodoPropuesto,
        "fecha_aprobacion": fechaAprobacion,
        "valor": valor,
        "estado": estado,
        "profileImage": profileImage,
        "fecsys": fecsys.toIso8601String(),
        "titulo": titulo,
        "nombre_estado": nombreEstado
      };
}
