import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/data/models/ProveedorAplicoOferta.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/Solicitante.dart';
import 'package:itsuit/data/models/SolicitudCategorias.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/contraOferta.dart';
import 'package:itsuit/data/models/cupon.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/models/trabajo_realizado.dart';
import 'package:itsuit/data/models/ubicaciones.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';

class Apis {
  final Dio _dio = Get.find<Dio>();
  final LocalAuth localAuth = new LocalAuth();

  Future<ContraOferta> getListContraOfertas(int idOferta) async {
    try {
      final Response response = await _dio.get('solicitud/contraoferta',
          queryParameters: {"id_respuesta": idOferta});
      return ContraOferta.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<ProveedorAplicoOferta> consultarProveedorSolicitud(int id) async {
    try {
      final Response response =
          await _dio.get('Solicitud/proveedor', queryParameters: {"id": id});
      return ProveedorAplicoOferta.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<bool> actualizarEstadoContraOferta(int id, int estado) async {
    try {
      await _dio.put(
          'solicitud/contraoferta/estado/${id.toString()}/${estado.toString()}');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<ProcesosDeSeleccion> getListSolicitudesDirectas(
      int tipoUsuario, int idTercero) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        final data = (tipoUsuario == 1)
            ? {"id_proveedor": idTercero}
            : {"id_solicitante": idTercero};
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response =
            await _dio.get('Solicitud/directa', queryParameters: data);
        return ProcesosDeSeleccion.fromJson(response.data);
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<String> uploadImage(PickedFile image, int id) async {
    try {
      String fileName = image.path.split('/').last;
      print(fileName);
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path,
            filename: fileName, contentType: new MediaType('image', 'jpeg')),
      });

      final Response response = await _dio.post('upload/save-image',
          queryParameters: {"idUsuario": id}, data: formData);

      return response.data['data']['imagen'];
    } catch (e) {
      return null;
    }
  }

  // ignore: missing_return
  Future<RegimenTributario> getListTributario() async {
    try {
      final Response response = await _dio.get('RegimenTributario');
      return RegimenTributario.fromJson(response.data);
    } catch (e) {}
  }

  Future<bool> cambioEstadoSolicitud(int idSolicitud, int estado) async {
    try {
      await _dio.put(
          'solicitud/estado/${idSolicitud.toString()}/${estado.toString()}');
      return true;
    } catch (err) {
      return false;
    }
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

  Future<ProcesosDeSeleccion> getListSolicitudesxCategoria(
      int idCategoria) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio
            .get('Solicitud', queryParameters: {"id_categoria": idCategoria});
        return ProcesosDeSeleccion.fromJson(response.data);
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

// ignore: non_constant_identifier_names
  Future<ProcesosDeSeleccion> getSolicitudes(int id_tercero,
      [int idSolicitud]) async {
    try {
      var queryParameters;
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        if (idSolicitud != null) {
          queryParameters = {"id_tercero": id_tercero, "id": idSolicitud};
        } else {
          queryParameters = {"id_tercero": id_tercero};
        }

        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response =
            await _dio.get('Solicitud', queryParameters: queryParameters);
        return ProcesosDeSeleccion.fromJson(response.data);
      } else {
        return throw Error();
      }
    } catch (e) {
      return null;
    }
  }

  Future<Proveedores> getListProveedores([bool idUser, int idCategoria]) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.get('proveedor', queryParameters: {
          "idUsuario": (idUser != null) ? idUser : false,
          "idCategoria": (idCategoria != null) ? idCategoria : null
        });
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
        final Response response = await _dio.get('Servicio',
            queryParameters: {"id": null, "idCategoria": idCategoria});
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
      // ignore: non_constant_identifier_names
      fecha_ejecucion,
      // ignore: non_constant_identifier_names
      fecha_fin_ejecucion,
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
          "fecha_ejecucion": fecha_ejecucion,
          "fecha_fin_ejecucion": fecha_fin_ejecucion,
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

  Future<bool> crearSolicitudDirecta(
      // ignore: non_constant_identifier_names
      id_servicio,
      // ignore: non_constant_identifier_names
      id_cupon,
      // ignore: non_constant_identifier_names
      id_tercero,
      // ignore: non_constant_identifier_names
      id_proveedor,
      titulo,
      // ignore: non_constant_identifier_names
      fecha_solicitud,
      // ignore: non_constant_identifier_names
      fecha_fin,
      presupuesto,
      descripcion,
      criterio) async {
    try {
      RequestToken rq = await localAuth.getSession();
      // ignore: non_constant_identifier_names
      int _id_cupon = (id_cupon != null) ? id_cupon : null;
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio.post('Solicitud', data: {
          "id_servicio": id_servicio,
          "id_tercero": id_tercero,
          "id_proveedor": id_proveedor,
          "id_tipo_solicitud": 2,
          "id_cupon": _id_cupon,
          "titulo": titulo,
          "fecha_solicitud": DateTime.now().toString(),
          "fecha_fin": fecha_fin,
          "fecha_seleccion": fecha_solicitud,
          "fecha_fin_seleccion": fecha_fin,
          "fecha_ejecucion": fecha_solicitud,
          "fecha_fin_ejecucion": fecha_fin,
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
    int idProveedor,
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
    int idProveedor,
    int idCupon,
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
    int idProveedor,
    int idServicio,
    String fechaInicio,
    String fechaFin,
    String titulo,
    String descripcion,
    double precioNormal,
    int porcentajeDescuento,
    int estado,
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

  Future<bool> updateDesactivarCupon(int idCupon) async {
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

  Future<bool> updatActivarCupon(int idCupon) async {
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
      int idCupon,
      int idProveedor,
      int idServicio,
      String fechaInicio,
      String fechaFin,
      String titulo,
      String descripcion,
      int precioNormal,
      int precioDescuento,
      int porcentajeDescuento,
      int estado) async {
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
      int idProveedor,
      int id,
      int idCategoria,
      String descripcion,
      String nombreTrabajo,
      String fechaInicio,
      String fechaFin,
      String empresa,
      int estado) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio
            .put('proveedor/portafolio/' + idProveedor.toString(), data: {
          "portafolio": {
            "id": 0,
            "id_categoria": idCategoria,
            "descripcion": descripcion,
            "nombre_trabajo": nombreTrabajo,
            "fecha_inicio": fechaInicio,
            "fecha_fin": fechaFin,
            "empresa": empresa,
            "estado": estado
          }
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

  Future<List<Categoria>> consultarCategoriasProveedor(int idProveedor) async {
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

  Future<bool> addCategoriasProveedor(
      int idProveedor, int idcategoria, int estado) async {
    try {
      RequestToken rq = await localAuth.getSession();
      if (rq != null) {
        _dio.options.headers['authorization'] = "Bearer ${rq.getToken()}";
        final Response response = await _dio
            .put('proveedor/categorias/' + idProveedor.toString(), data: {
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

  Future<Proveedor> getProveedor(idProveedor) async {
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
    int idProveedor,
    int idTipoDocumento,
    int idRegimenTributario,
    int idCiudad,
    String dni,
    String digito,
    String nombreProveedor,
    String fechaRegistro,
    String email,
    String telefono,
    String celular,
    String direccion,
    int tiempoExperiencia,
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

  Future<bool> createOferta(int idSolicitud, int idTercero, String fecha,
      String titulo, int plazo, String descripcion, double valor) async {
    try {
      final Response response = await _dio.post('Solicitud/respuesta', data: {
        "id_solicitud": idSolicitud,
        "id_tercero": idTercero,
        "fecha": fecha,
        "titulo": titulo,
        "descripcion": descripcion,
        "periodo_propuesto": plazo,
        "valor": valor,
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
