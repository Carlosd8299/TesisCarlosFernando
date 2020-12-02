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
  String fechaSolicitud;
  String fechaFinRecepcion;
  String fechaSeleccion;
  String fechafinSeleccion;
  String titulo;
  String descripcion;
  String criterios;
  int idCategoria;
  int idServicio;
  double presupuestos;
  List<Categoria> _categorias = [];
  List<Servicio> _servicios = [];

  List<Categoria> get getCategorias => this._categorias;

  List<Servicio> get getServicios => this._servicios;

  Categoria get getCategoria => Categoria();

  Servicio get getServicio => Servicio();

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
      await this.loadServicios();
    }
  }

  void onServicioChanged(int value) {
    if (value != null) {
      this.idServicio = value;
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

  void onFechaSolicitudChanged(value) {
    if (value != null) {
      this.fechaSolicitud = value.toString();
    }
  }

  void onfechaFinRecepcionChanged(value) {
    if (value != null) {
      this.fechaFinRecepcion = value.toString();
    }
  }

  void onfechaSeleccionChanged(value) {
    if (value != null) {
      this.fechaSeleccion = value.toString();
    }
  }

  void onfechafinSeleccionChanged(value) {
    if (value != null) {
      this.fechafinSeleccion = value.toString();
    }
  }

  void crearSolicitud() async {
    bool res = await _apirepo.crearSolicitud(
        this.idServicio,
        r.usuario.idTercero,
        1,
        this.titulo,
        this.fechaSolicitud,
        this.fechaFinRecepcion,
        this.fechaSeleccion,
        this.fechafinSeleccion,
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
    this.r = Get.arguments as RequestToken;
    await this.loadCategorias();
    super.onInit();
  }
}
