import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/Solicitante.dart';
import 'package:itsuit/data/models/SolicitudCategorias.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/cupon.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/models/trabajo_realizado.dart';
import 'package:itsuit/data/models/ubicaciones.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';

class Apis {
  final Dio _dio = Get.find<Dio>();
  final LocalAuth localAuth = new LocalAuth();

  // ignore: missing_return
  Future<RegimenTributario> getListTributario() async {
    try {
      final Response response = await _dio.get('RegimenTributario');
      return RegimenTributario.fromJson(response.data);
    } catch (e) {}
  }

  Future<bool> cambioEstadoOferta(int idOferta, int estado) async {
    try {
      await _dio.put(
          'Solicitud/respuesta/estado/${idOferta.toString()}/${estado.toString()}');
      return true;
    } catch (err) {
      return false;
    }
  }

  // ignore: missing_return
  Future<Ubicacion> getListCiudades() async {
    try {
      final Response response = await _dio.get('ciudad');
      return Ubicacion.fromJson(response.data);
    } catch (e) {}
  }

  // ignore: missing_return
  Future<ActividadEconomica> getListActEco() async {
    try {
      final Response response = await _dio.get('ActividadEconomica');
      return ActividadEconomica.fromJson(response.data);
    } catch (e) {}
  }

  Future<SolicitudCategorias> getListCantSolicitudesCategoria() async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('Solicitud/cateroria');
        return SolicitudCategorias.fromJson(response.data);
      } else {
        throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<SolicitudCategorias> getListCantProveedorCategoria() async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('Categoria/proveedor');
        return SolicitudCategorias.fromJson(response.data);
      } else {
        throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<ProcesosDeSeleccion> getListSolicitudes() async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('Solicitud/recomendado');
        return ProcesosDeSeleccion.fromJson(response.data);
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

// ignore: non_constant_identifier_names
  Future<ProcesosDeSeleccion> getSolicitudes(int id_tercero) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio
            .get('Solicitud', queryParameters: {"id_tercero": id_tercero});
        return ProcesosDeSeleccion.fromJson(response.data);
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<Proveedores> getListProveedores([bool idUser]) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('proveedor',
            queryParameters: {"idUsuario": (idUser != null) ? idUser : false});
        final Proveedores p = Proveedores.fromJson(response.data);
        return p;
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<Categorias> getCategorias() async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('Categoria');
        final Categorias p = Categorias.fromJson(response.data);
        return p;
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<Servicios> getServicios(int idCategoria) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio
            .get('Servicio', queryParameters: {"idCategoria": idCategoria});
        final Servicios p = Servicios.fromJson(response.data);
        return p;
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<Solicitante> getListSolicitante([bool idUser]) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('empresasolicitante',
            queryParameters: {"idUsuario": (idUser != null) ? idUser : false});
        final Solicitante p = Solicitante.fromJson(response.data);
        return p;
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<Ofertas> getListOfertas(int idSolicitud) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('Solicitud/respuesta',
            queryParameters: {"id_solicitud": idSolicitud});
        final Ofertas p = Ofertas.fromJson(response.data);
        return p;
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> crearSolicitud(
      // ignore: non_constant_identifier_names
      id_servicio,
      // ignore: non_constant_identifier_names
      id_tercero,
      // ignore: non_constant_identifier_names
      id_tipo_solicitud,
      titulo,
      // ignore: non_constant_identifier_names
      fecha_solicitud,
      // ignore: non_constant_identifier_names
      fecha_fin,
      // ignore: non_constant_identifier_names
      fecha_seleccion,
      // ignore: non_constant_identifier_names
      fecha_fin_seleccion,
      presupuesto,
      descripcion,
      criterio) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.post('Solicitud', data: {
          "id_servicio": id_servicio,
          "id_tercero": id_tercero,
          "id_tipo_solicitud": id_tipo_solicitud,
          "titulo": titulo,
          "fecha_solicitud": fecha_solicitud,
          "fecha_fin": fecha_fin,
          "fecha_seleccion": fecha_seleccion,
          "fecha_fin_seleccion": fecha_fin_seleccion,
          "presupuesto": presupuesto,
          "descripcion": descripcion,
          "criterio": criterio
        });
        if (response.statusCode != 200) {
          return false;
        } else {
          return true;
        }
      } else {
        throw Error();
      }
    } catch (e) {
      return false;
    }
  }

  //QueryParameters
  Future<List<Cupon>> consultarTodosCuponesProveedor(
    @required int idProveedor,
  ) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('proveedor/cupon',
            queryParameters: {"id_tercero": idProveedor.toString()});
        return (response.data['data'] as List)
            .map((e) => Cupon.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

//queryParameters
  Future<Cupon> consultarCuponesEspecifico(
    @required int idProveedor,
    @required int idCupon,
  ) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('proveedor/cupon',
            queryParameters: {
              "id_tercero": idProveedor.toString(),
              "id": idCupon
            });
        return Cupon.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> createCupon(
    @required int idProveedor,
    @required int idServicio,
    @required String fechaInicio,
    @required String fechaFin,
    @required String titulo,
    @required String descripcion,
    @required double precioNormal,
    @required int porcentajeDescuento,
    @required int estado,
  ) async {
    try {
      final Response response = await _dio.post('proveedor/cupon', data: {
        "id_proveedor": idProveedor,
        "id_servicio": idServicio,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
        "titulo": titulo,
        "descripcion": descripcion,
        "precio_normal": precioNormal,
        "porcentaje_descuento": porcentajeDescuento,
        "estado": estado
      });
      if (response.statusCode != 200) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateDesactivarCupon(@required int idCupon) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.put(
            'proveedor/cupon/estado/' + idCupon.toString(),
            data: {"estado": 0});
        if (response.statusCode != 200) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      printError();
      return false;
    }
  }

  Future<bool> updatActivarCupon(@required int idCupon) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.put(
            'proveedor/cupon/estado/' + idCupon.toString(),
            data: {"estado": 1});
        if (response.statusCode != 200) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      printError();
      return false;
    }
  }

  //
  Future<bool> updateCupon(
      @required int idCupon,
      @required int idProveedor,
      @required int idServicio,
      @required String fechaInicio,
      @required String fechaFin,
      @required String titulo,
      @required String descripcion,
      @required int precioNormal,
      @required int precioDescuento,
      @required int porcentajeDescuento,
      @required int estado) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response =
            await _dio.post('proveedor/cupon/' + idCupon.toString(), data: {
          "id_proveedor": idProveedor,
          "id_servicio": idServicio,
          "fecha_inicio": fechaInicio,
          "fecha_fin": fechaFin,
          "titulo": titulo,
          "descripcion": descripcion,
          "precio_normal": precioNormal,
          "porcentaje_descuento": porcentajeDescuento,
          "estado": estado
        });
        if (response.statusCode != 200) {
          return false;
        } else {
          return true;
        }
      } else {
        throw Error();
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> createTrabajoRealizado(
      @required int idProveedor,
      @required int id,
      @required int idCategoria,
      @required String descripcion,
      @required String nombreTrabajo,
      @required String fechaInicio,
      @required String fechaFin,
      @required int estado) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio
            .put('proveedor/portafolio/' + idProveedor.toString(), data: {
          "portafolio": {
            "id": id,
            "id_categoria": idCategoria,
            "descripcion": descripcion,
            "nombre_trabajo": nombreTrabajo,
            "fecha_inicio": fechaInicio,
            "fecha_fin": fechaFin,
            "estado": estado
          }
        });
        if (response.statusCode != 200) {
          return false;
        } else {
          return true;
        }
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<TrabajoRealizado>> consultarPortafolio(int idProveedor) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('proveedor/protafolio',
            queryParameters: {'id': idProveedor.toString()});
        return (response.data['data'] as List)
            .map((e) => TrabajoRealizado.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<TrabajoRealizado>> consultarHistorico(int idProveedor) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('proveedor/historial',
            queryParameters: {'id': idProveedor.toString()});
        return (response.data['data'] as List)
            .map((e) => TrabajoRealizado.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Categoria>> consultarCategoriasProveedor(
      @required int idProveedor) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('proveedor/categorias',
            queryParameters: {'id': idProveedor.toString()});
        return (response.data['data'] as List)
            .map((e) => Categoria.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> addCategoriasProveedor(@required int idProveedor,
      @required int idcategoria, @required int estado) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio
            .put('proveedor/categorias' + idProveedor.toString(), data: {
          "categorias": {"id_categoria": idcategoria, "estado": estado}
        });

        if (response.statusCode != 200) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      printError();
      return false;
    }
  }

  Future<Proveedor> getProveedor(@required idProveedor) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('proveedor',
            queryParameters: {"idUsuario": true, "id": idProveedor});
        final Proveedor p = Proveedor.fromJson(response.data);
        return p;
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateProveedor(
    @required int idProveedor,
    @required int idTipoDocumento,
    @required int idRegimenTributario,
    @required int idCiudad,
    @required String dni,
    @required String digito,
    @required String nombreProveedor,
    @required String fechaRegistro,
    @required String email,
    @required String telefono,
    @required String celular,
    @required String direccion,
    @required int tiempoExperiencia,
  ) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio
            .put('proveedor/proveedor' + idProveedor.toString(), data: {
          "id_tipo_documento": idTipoDocumento,
          "id_regimen_tributario": idRegimenTributario,
          "id_ciudad": idCiudad,
          "dni": dni,
          "nombre_tercero": nombreProveedor,
          "fecha_registro": fechaRegistro.toString(),
          "email": email,
          "telefono": telefono,
          "celular": celular,
          "direccion": direccion,
          "tiempo_experiencia": tiempoExperiencia,
          "estado": 1
        });

        if (response.statusCode != 200) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      printError();
      return false;
    }
  }

  Future<bool> createContraOferta(
      int idOferta, String fecha, int plazo, String descripcion) async {
    try {
      final Response response =
          await _dio.post('solicitud/contraoferta', data: {
        "id_respuesta": idOferta,
        "fecha": fecha,
        "plazo": plazo,
        "descripcion": descripcion,
        "estado": 1
      });
      if (response.statusCode != 200) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
