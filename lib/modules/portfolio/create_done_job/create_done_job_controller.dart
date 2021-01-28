import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/routes/my_routes.dart';

class CreateDoneJobController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken _r;
  String titulo;
  String empresa = '';
  String descripcion;
  int tiempoEjecucion;
  DateTime fechaInicio = DateTime.now();
  DateTime fechaFin = DateTime.now();
  int _selectedIndexCategoria = 1, _selectedIndexServicio = 1;
  int idCategoria;
  int idServicio;
  List<Categoria> _categorias = [];
  List<Servicio> _servicios = [];

  List<Categoria> get getCategorias => this._categorias;

  List<Servicio> get getServicios => this._servicios;

  int get getCategoria => this._selectedIndexCategoria;

  int get getServicio => this._selectedIndexServicio;

  Future<void> loadCategorias() async {
    final data = await _apirepo.getCategorias();

    if (data != null) {
      _categorias = data.data;
      if (_categorias.length > 0) {
        _selectedIndexCategoria = _categorias[0].id;
      }
    } else {
      _categorias = [];
    }

    await this.loadServicios();
    update(['categorias']);
  }

  Future<void> loadServicios() async {
    final data = await _apirepo.getServicios(this.idCategoria);

    if (data != null) {
      _servicios = data.data;
      if (_servicios.length > 0) {
        _selectedIndexServicio = _servicios[0].id;
      }
    } else {
      _servicios = [];
    }
    update(['servicios']);
  }

  Future<void> onCategoriaChanged(int value) async {
    if (value != null) {
      this.idCategoria = value;
      this._selectedIndexCategoria = value;
      await this.loadServicios();
      update(['categorias']);
    }
  }

  void onServicioChanged(int value) {
    if (value != null) {
      this.idServicio = value;
      this._selectedIndexServicio = value;
      update(['servicios']);
    }
  }

  void onDecripcionChanged(String value) {
    if (value != null) {
      this.descripcion = value;
    }
  }

  void onTituloChanged(String value) {
    if (value != null) {
      this.titulo = value;
    }
  }

  void onEmpresaChanged(String value) {
    if (value != null) {
      this.empresa = value;
    }
  }

  void onTiempoEjecucionChanged(int value) {
    if (value != null) {
      this.tiempoEjecucion = value;
    }
  }

  void onFechaInicioChanged(DateTime value) {
    this.fechaInicio = value;
  }

  void onFechaFinChanged(DateTime value) {
    this.fechaFin = value;
  }

  void createDoneJob() async {
    bool res = await _apirepo.createTrabajoRealizado(
        this._r.usuario.idTercero,
        this.idCategoria,
        this.descripcion,
        this.titulo,
        this.fechaInicio.toString(),
        this.fechaFin.toString(),
        this.empresa.trim());
    if (res) {
      Get.dialog(AlertDialog(
          title: Text("¡Proceso exitoso!"),
          content: Text("Se ha registrado el trabajo realizado"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                  Get.offNamed(AppRoutes.OWNPROFILE, arguments: _r);
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
    this._r = await LocalAuth().getSession();
    this.loadCategorias();
    super.onInit();
  }
}
