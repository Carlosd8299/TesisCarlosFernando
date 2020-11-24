import 'package:meta/meta.dart';

class Ubicacion {
  Ubicacion({
    @required this.ciudades,
  });

  final List<Ciudade> ciudades;

  factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        ciudades: List<Ciudade>.from(
            json["ciudades"].map((x) => Ciudade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ciudades": List<dynamic>.from(ciudades.map((x) => x.toJson())),
      };
}

class Ciudade {
  Ciudade({
    @required this.idPais,
    @required this.nombrePais,
    @required this.idDepartamento,
    @required this.nombreDepartamento,
    @required this.id,
    @required this.codigo,
    @required this.nombre,
    @required this.estado,
  });

  final int idPais;
  final String nombrePais;
  final int idDepartamento;
  final String nombreDepartamento;
  final int id;
  final String codigo;
  final String nombre;
  final int estado;

  factory Ciudade.fromJson(Map<String, dynamic> json) => Ciudade(
        idPais: json["id_pais"],
        nombrePais: json["nombre_pais"],
        idDepartamento: json["id_departamento"],
        nombreDepartamento: json["nombre_departamento"],
        id: json["id"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id_pais": idPais,
        "nombre_pais": nombrePais,
        "id_departamento": idDepartamento,
        "nombre_departamento": nombreDepartamento,
        "id": id,
        "codigo": codigo,
        "nombre": nombre,
        "estado": estado,
      };
}
