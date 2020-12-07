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
import 'package:itsuit/data/models/trabajo_realizado.dart';
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
    @required int idProveedor,
    @required int idPortafolio,
    @required int idCategoria,
    @required String descripcion,
    @required String nombreTrabajo,
    @required String fechaInicio,
    @required String fechaFin,
  ) =>
      _apis.createTrabajoRealizado(idPortafolio, idProveedor, idCategoria,
          descripcion, nombreTrabajo, fechaInicio, fechaFin, 1);

  //Consultar portafolio del proveedor
  Future<List<TrabajoRealizado>> consultarPortafolio(
          @required int idProveedor) =>
      _apis.consultarPortafolio(idProveedor);

//------------------------
// Seccion de categorias del proveedor
//------------------------

// Get categorias de un proveedor especifico
  Future<List<Categoria>> consultarCategoriasProveedor(
          @required int idProveedor) =>
      _apis.consultarCategoriasProveedor(idProveedor);

// Agregar una categoria al proveedor
  Future<bool> addCategoriasProveedor(@required int idProveedor,
          @required int idcategoria, @required int estado) =>
      _apis.addCategoriasProveedor(idProveedor, idcategoria, estado);

  Future<bool> createContraOferta(
    int idOferta,
    String fecha,
    int plazo,
    String descripcion,
  ) =>
      _apis.createContraOferta(idOferta, fecha, plazo, descripcion);
}
