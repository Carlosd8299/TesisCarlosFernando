import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/routes/my_routes.dart';

class CreateProcesoController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;
  // variables del proceso
  String _fechaIncioEjecucion;
  String _fechaFinEjecucion;
  String _fechaIncioRecepcion;
  String _fechaFinRecepcion;
  String _fechaInicioSeleccion;
  String _fechaFinSeleccion;
  String titulo;
  String descripcion;
  String criterios;
  int idCategoria;
  int idServicio;
  int _selectedIndexCategoria = 1;
  int _selectedIndexServicio = 1;
  double presupuestos;
  List<Categoria> _categorias = [];
  List<Servicio> _servicios = [];

  String get getFechaInicioEjecucion => _fechaIncioEjecucion;
  String get getFechaFinEjecucion => _fechaFinEjecucion;
  String get getFechaInicioRecepcion => _fechaIncioRecepcion;
  String get getFechaFinRecepcion => _fechaFinRecepcion;
  String get getFechaInicioSeleccion => _fechaInicioSeleccion;
  String get getFechaFinSeleccion => _fechaFinSeleccion;

  List<Categoria> get getCategorias => this._categorias;

  List<Servicio> get getServicios => this._servicios;

  int get getCategoria => this._selectedIndexCategoria;

  int get getServicio => this._selectedIndexServicio;

  Future<void> loadCategorias() async {
    final data = await _apirepo.getCategorias();
    _categorias = data.data;
    update(['categorias']);
  }

  Future<void> loadServicios() async {
    final data = await _apirepo.getServicios(this.idCategoria);
    _servicios = data.data;
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
      this._fechaIncioEjecucion = value.toString();
    }
  }

  void onFechaFinEjecucionChanged(value) {
    if (value != null) {
      this._fechaFinEjecucion = value.toString();
    }
  }

  void onfechaInicioRecepcionChanged(value) {
    if (value != null) {
      this._fechaIncioRecepcion = value.toString();
    }
  }

  void onfechaFinRecepcionChanged(value) {
    if (value != null) {
      this._fechaFinRecepcion = value.toString();
    }
  }

  void onfechaInicioSeleccionChanged(value) {
    if (value != null) {
      this._fechaInicioSeleccion = value.toString();
    }
  }

  void onfechaFinSeleccionChanged(value) {
    if (value != null) {
      this._fechaFinSeleccion = value.toString();
    }
  }

  void crearSolicitud() async {
    bool res;
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
    this.r = Get.arguments as RequestToken;
    await this.loadCategorias();
    super.onInit();
  }
}
