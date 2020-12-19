import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/data/models/ProveedorAplicoOferta.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/Solicitante.dart';
import 'package:itsuit/data/models/SolicitudCategorias.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/cupon.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/models/trabajo_realizado.dart';
import 'package:itsuit/data/models/ubicaciones.dart';
import 'package:itsuit/data/provider/reomote/api.dart';

class ApiRepository {
  final Apis _apis = Get.find<Apis>();
  Future<Ubicacion> getCiudades() => _apis.getListCiudades();
  Future<RegimenTributario> getRegimenes() => _apis.getListTributario();
  Future<ActividadEconomica> getActEco() => _apis.getListActEco();

  //Consultar proveedores que han aplicado a una solicitud
  Future<ProveedorAplicoOferta> consultarProveedorSolicitud(int idSolicitud) =>
      _apis.consultarProveedorSolicitud(idSolicitud);

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
          // ignore: non_constant_identifier_names
          fecha_ejecucion,
          // ignore: non_constant_identifier_names
          fecha_fin_ejecucion,
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
          fecha_ejecucion,
          fecha_fin_ejecucion,
          presupuesto,
          descripcion,
          criterio);
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
          criterios) =>
      _apis.crearSolicitudDirecta(
          // ignore: non_constant_identifier_names
          id_servicio,
          // ignore: non_constant_identifier_names
          id_cupon,
          // ignore: non_constant_identifier_names
          id_tercero,
          id_proveedor,
          titulo,
          // ignore: non_constant_identifier_names
          fecha_solicitud,
          // ignore: non_constant_identifier_names
          fecha_fin,
          presupuesto,
          descripcion,
          criterios);

  Future<ProcesosDeSeleccion> getSolicitudes(int idTercero) =>
      _apis.getSolicitudes(idTercero);
//------------------------
// Seccion de proveedores
//------------------------

//Obtener info un proveedor

  Future<Proveedor> getProveedor(@required idProveedor) =>
      _apis.getProveedor(idProveedor);
  // Modificar un proveedor

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
  ) =>
      _apis.updateProveedor(
          idProveedor,
          idTipoDocumento,
          idRegimenTributario,
          idCiudad,
          dni,
          digito,
          nombreProveedor,
          fechaRegistro,
          email,
          telefono,
          celular,
          direccion,
          tiempoExperiencia);

//------------------------
// Seccion de cupones
//------------------------

// consultar cupones del proveedor
  Future<List<Cupon>> consultarCuponesProveedor(@required int idProveedor) =>
      _apis.consultarTodosCuponesProveedor(idProveedor);

// Consultar un cupon espeficio de un proveedor
  Future<Cupon> consultarSingleCupon(
    @required int idProveedor,
    @required int idCupon,
  ) =>
      _apis.consultarCuponesEspecifico(idProveedor, idCupon);
// Crear cupon
  Future<bool> createCupon(
    int idProveedor,
    int idServicio,
    String fechaInicio,
    String fechaFin,
    String titulo,
    String descripcion,
    double precioNormal,
    int porcentajeDescuento,
  ) =>
      _apis.createCupon(idProveedor, idServicio, fechaInicio, fechaFin, titulo,
          descripcion, precioNormal, porcentajeDescuento, 1);

  // Actualizar cupon
  Future<bool> actualizarCupon(
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
  ) =>
      _apis.updateCupon(
          idCupon,
          idProveedor,
          idServicio,
          fechaInicio,
          fechaFin,
          titulo,
          descripcion,
          precioNormal,
          precioDescuento,
          porcentajeDescuento,
          1);
  //Desactivar cupon
  Future<bool> desactivarCupon(@required int idCupon) =>
      _apis.updateDesactivarCupon(idCupon);

  //Activar cupon
  Future<bool> activarCupon(@required int idCupon) =>
      _apis.updatActivarCupon(idCupon);

//------------------------
// Seccion de trabajo realizado y portafolio
//------------------------

// Agregar un trbajo realizado
  Future<bool> createTrabajoRealizado(
          int idProveedor,
          int idCategoria,
          String descripcion,
          String nombreTrabajo,
          String fechaInicio,
          String fechaFin,
          String empresa,
          [int idPortafolio]) =>
      _apis.createTrabajoRealizado(idProveedor, idPortafolio, idCategoria,
          descripcion, nombreTrabajo, fechaInicio, fechaFin, empresa, 1);

  //Consultar portafolio del proveedor
  Future<List<TrabajoRealizado>> consultarPortafolio(int idProveedor) =>
      _apis.consultarPortafolio(idProveedor);
  //Consultar portafolio del proveedor
  Future<List<TrabajoRealizado>> consultarHistorico(int idProveedor) =>
      _apis.consultarHistorico(idProveedor);

//------------------------
// Seccion de categorias del proveedor
//------------------------

// Get categorias de un proveedor especifico
  Future<List<Categoria>> consultarCategoriasProveedor(
          @required int idProveedor) =>
      _apis.consultarCategoriasProveedor(idProveedor);

// Agregar una categoria al proveedor
  Future<bool> addCategoriasProveedor(
          @required int idProveedor, @required int idcategoria) =>
      _apis.addCategoriasProveedor(idProveedor, idcategoria, 1);

  Future<bool> createContraOferta(
    int idOferta,
    String fecha,
    int plazo,
    String descripcion,
  ) =>
      _apis.createContraOferta(idOferta, fecha, plazo, descripcion);
}
