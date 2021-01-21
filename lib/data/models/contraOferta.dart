class ContraOferta {
  ContraOferta({
    this.result,
  });

  Result result;

  factory ContraOferta.fromJson(Map<String, dynamic> json) => ContraOferta(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.data,
  });

  List<ContraOfertas> data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        data: List<ContraOfertas>.from(
            json["data"].map((x) => ContraOfertas.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ContraOfertas {
  ContraOfertas({
    this.id,
    this.idRespuesta,
    this.idSolicitante,
    this.fecha,
    this.plazo,
    this.descripcion,
    this.fecsys,
    this.idEstado,
    this.estado,
  });
  int id;
  int idSolicitante;
  int idRespuesta;
  DateTime fecha;
  int plazo;
  String descripcion;
  DateTime fecsys;
  int idEstado;
  String estado;

  factory ContraOfertas.fromJson(Map<String, dynamic> json) => ContraOfertas(
        id: json["id"],
        idRespuesta: json["id_respuesta"],
        idSolicitante: json["id_solicitante"],
        fecha: DateTime.parse(json["fecha"]),
        plazo: json["plazo"],
        descripcion: json["descripcion"],
        fecsys: DateTime.parse(json["fecsys"]),
        idEstado: json["id_estado"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_respuesta": idRespuesta,
        "id_solicitante": idSolicitante,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "plazo": plazo,
        "descripcion": descripcion,
        "fecsys":
            "${fecsys.year.toString().padLeft(4, '0')}-${fecsys.month.toString().padLeft(2, '0')}-${fecsys.day.toString().padLeft(2, '0')}",
        "id_estado": idEstado,
        "estado": estado,
      };
}
