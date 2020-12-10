import 'dart:convert';

Proveedores proveedoresFromJson(String str) =>
    Proveedores.fromJson(json.decode(str));

String proveedoresToJson(Proveedores data) => json.encode(data.toJson());

class Proveedores {
  Proveedores({
    this.data,
  });

  List<Proveedor> data;

  factory Proveedores.fromJson(Map<String, dynamic> json) => Proveedores(
        data: List<Proveedor>.from(
            json["data"].map((x) => Proveedor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Proveedor {
  Proveedor({
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
    this.nombreProveedor,
    this.fechaRegistro,
    this.email,
    this.telefono,
    this.celular,
    this.direccion,
    this.tiempoExperiencia,
    this.estado,
    this.categorias,
    this.cantidadParticipa,
    this.cantidadAprobada,
    this.cantidadDirecta,
    this.profileImage,
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
  String digito;
  String nombreProveedor;
  String fechaRegistro;
  String email;
  String telefono;
  String celular;
  String direccion;
  int tiempoExperiencia;
  int estado;
  List<String> categorias;
  int cantidadParticipa;
  int cantidadAprobada;
  int cantidadDirecta;
  String profileImage;

  factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
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
        nombreProveedor: json["nombre_proveedor"],
        fechaRegistro: json["fecha_registro"],
        email: json["email"],
        telefono: json["telefono"],
        celular: json["celular"],
        direccion: json["direccion"],
        tiempoExperiencia: json["tiempo_experiencia"],
        estado: json["estado"],
        categorias: List<String>.from(jsonDecode(json["categorias"])),
        cantidadParticipa: json["cantidadParticipa"],
        cantidadAprobada: json["cantidadAprobada"],
        cantidadDirecta: json["cantidadDirecta"],
        profileImage: json["profileImage"],
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
        "nombre_proveedor": nombreProveedor,
        "fecha_registro": fechaRegistro,
        "email": email,
        "telefono": telefono,
        "celular": celular,
        "direccion": direccion,
        "tiempo_experiencia": tiempoExperiencia,
        "estado": estado,
        "categorias": List<dynamic>.from(categorias.map((x) => x)),
        "cantidadParticipa": cantidadParticipa,
        "cantidadAprobada": cantidadAprobada,
        "cantidadDirecta": cantidadDirecta,
        "profileImage": profileImage,
      };
}
