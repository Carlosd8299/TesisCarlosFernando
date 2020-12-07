import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/Solicitante.dart';
import 'package:itsuit/data/models/SolicitudCategorias.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/models/ubicaciones.dart';
import 'package:itsuit/data/provider/reomote/api.dart';

class ApiRepository {
  final Apis _apis = Get.find<Apis>();
  Future<Ubicacion> getCiudades() => _apis.getListCiudades();
  Future<RegimenTributario> getRegimenes() => _apis.getListTributario();
  Future<ActividadEconomica> getActEco() => _apis.getListActEco();

  Future<SolicitudCategorias> getListCantSolicitudesCategoria() =>
      _apis.getListCantSolicitudesCategoria();

  Future<ProcesosDeSeleccion> getListSolicitudes() =>
      _apis.getListSolicitudes();

  Future<Proveedores> getListProveedores([bool idUser]) =>
      _apis.getListProveedores(idUser);

  Future<SolicitudCategorias> getListCantProveedorCategoria() =>
      _apis.getListCantProveedorCategoria();

  Future<Solicitante> getListSolicitante([bool idUser]) =>
      _apis.getListSolicitante(idUser);

  Future<Categorias> getCategorias() => _apis.getCategorias();

  Future<Servicios> getServicios(int idCategoria) =>
      _apis.getServicios(idCategoria);

  Future<Ofertas> getListOfertas(int idSolicitud) =>
      _apis.getListOfertas(idSolicitud);
  Future<bool> cambioEstadoOferta(int idOferta, int estado) =>
      _apis.cambioEstadoOferta(idOferta, estado);

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
          criterio) =>
      _apis.crearSolicitud(
          id_servicio,
          id_tercero,
          id_tipo_solicitud,
          titulo,
          fecha_solicitud,
          fecha_fin,
          fecha_seleccion,
          fecha_fin_seleccion,
          presupuesto,
          descripcion,
          criterio);

  Future<ProcesosDeSeleccion> getSolicitudes(int idTercero) =>
      _apis.getSolicitudes(idTercero);

  Future<bool> createCupon(
    int idTercero,
    int idServicio,
    String fechaInicio,
    String fechaFin,
    String titulo,
    String descripcion,
    int precioNormal,
    int precioDescuento,
    int porcentajeDescuento,
  ) =>
      _apis.createCupon(idTercero, idServicio, fechaInicio, fechaFin, titulo,
          descripcion, precioNormal, precioDescuento, porcentajeDescuento, 1);

  Future<bool> createContraOferta(
    int idOferta,
    String fecha,
    int plazo,
    String descripcion,
  ) =>
      _apis.createContraOferta(idOferta, fecha, plazo, descripcion);
}
