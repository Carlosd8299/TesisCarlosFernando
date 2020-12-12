import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/cupon.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:flutter/material.dart';
import 'package:itsuit/routes/my_routes.dart';

class CreateSeleccionDirectaController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;
  // variables del proceso
  String fechaInicioEjecucion = DateTime.now().toString();
  String fechafinEjecucion = DateTime.now().toString();
  String titulo;
  String descripcion;
  String criterios;
  int idCategoria;
  int idServicio;
  int _selectedIndexCategoria = 1;
  int _selectedIndexServicio = 1;
  double presupuestos;
  bool aplicaCupon;
  int _idProveedor;
  Cupon cupon;
  List<Categoria> _categorias = [];
  List<Servicio> _servicios = [];

  List<Categoria> get getCategorias => this._categorias;

  List<Servicio> get getServicios => this._servicios;

  int get getCategoria => this._selectedIndexCategoria;

  int get getServicio => this._selectedIndexServicio;

  Future<void> loadCategorias() async {
    final data = await _apirepo.getCategorias();
    _categorias = data.data;
    await this.loadServicios();
    update(['categorias']);
  }

  Future<void> loadServicios() async {
    final data = await _apirepo.getServicios(this.idCategoria);

    if (data != null) {
      _servicios = data.data;
      if (_servicios.length > 0) {
        _selectedIndexServicio = _servicios[0].id;
        this.idServicio = _servicios[0].id;
      }
    } else {
      _servicios = [];
    }
    update(['servicios']);
  }

  void onTituloChanged(value) {
    if (value != null) {
      this.titulo = value;
    }
  }

  Future<void> onCategoriaChanged(int value) async {
    if (value != null) {
      this.idCategoria = value;
      this._selectedIndexCategoria = value;
      await this.loadServicios();
    }
  }

  void onServicioChanged(int value) {
    if (value != null) {
      this.idServicio = value;
      this._selectedIndexServicio = value;
    }
  }

  void onDescripcionChanged(value) {
    if (value != null) {
      this.descripcion = value;
    }
  }

  void onCriteriosChanged(value) {
    if (value != null) {
      this.criterios = value;
    }
  }

  void onPresupuestoChanged(String value) {
    if (value != null) {
      this.presupuestos = double.parse(value.trim());
    }
  }

  void onFechaInicioEjecucionChanged(value) {
    if (value != null) {
      this.fechaInicioEjecucion = value.toString();
    }
  }

  void onFechaFinEjecucionChanged(value) {
    if (value != null) {
      this.fechafinEjecucion = value.toString();
    }
  }

  void crearSolicitud() async {
    bool res = await _apirepo.crearSolicitudDirecta(
        this.idServicio,
        (cupon != null) ? cupon.id : null,
        r.usuario.idTercero,
        this._idProveedor,
        this.titulo,
        this.fechaInicioEjecucion,
        this.fechafinEjecucion,
        this.presupuestos,
        this.descripcion,
        this.criterios);

    if (res) {
      Get.dialog(AlertDialog(
          title: Text("¡Proceso exitoso!"),
          content: Text("Se ha creado la solicitud"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                  Get.offNamed(AppRoutes.OWNPROFILE, arguments: r);
                },
                child: Text("OK"))
          ]));
    } else {
      Get.dialog(AlertDialog(
          title: Text("¡Ha ocurrido un error!"),
          content:
              Text("Por favor verifique que toda la información esté completa"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"))
          ]));
    }
  }

  @override
  void onInit() async {
    _idProveedor = Get.arguments[0] as int;
    aplicaCupon = Get.arguments[1] as bool;

    this.r = await LocalAuth().getSession();
    await this.loadCategorias();

    if (aplicaCupon) {
      cupon = Get.arguments[2] as Cupon;
    }

    super.onInit();
  }
}
