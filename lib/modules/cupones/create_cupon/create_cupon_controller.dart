import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:flutter/material.dart';

class CreateCuponController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken _r;
  String _tituloCupon, _descripCupon, _fechaLimite;
  int _porcentajeCupon, _selectedIndexCategoria = 1, _selectedIndexServicio = 1;
  double _precioCupon;
  int idCategoria;
  int idServicio;
  List<Categoria> _categorias = [];
  List<Servicio> _servicios = [];

  // Metodos Get

  List<Categoria> get getCategorias => this._categorias;

  List<Servicio> get getServicios => this._servicios;

  int get getSelectedCategoria => this._selectedIndexCategoria;

  int get getSelectedServicio => this._selectedIndexServicio;

// Obtener las categorias del end point
  Future<void> loadCategorias() async {
    final data = await _apirepo.getCategorias();
    _categorias = data.data;
    update(['categorias']);
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

// Obetner los servisios del en point dada una categoria
  loadServicios() async {
    final data = await _apirepo.getServicios(this.idCategoria);
    _servicios = data.data;
    update(['servicios']);
  }

  onTituloCuponChanged(String value) {
    _tituloCupon = value;
  }

  onDescripCuponChanged(String value) {
    _descripCupon = value;
  }

  onPrecioCuponChanged(String value) {
    _precioCupon = double.parse(value);
  }

  onPorcentajeCuponChanged(String value) {
    _porcentajeCupon = int.parse(value);
  }

  onFechaLimiteCuponChanged(String value) {
    _fechaLimite = value;
  }

  void onCreateCupon() async {
    if (this._r.usuario.idTercero != null &&
        this.idServicio != null &&
        this._fechaLimite != null &&
        this._tituloCupon != null &&
        this._descripCupon != null &&
        this._precioCupon != null &&
        this._porcentajeCupon != null) {
      bool res = await _apirepo.createCupon(
          this._r.usuario.idTercero,
          idServicio,
          DateTime.now().toString(),
          _fechaLimite,
          _tituloCupon,
          _descripCupon,
          _precioCupon,
          _porcentajeCupon);
      if (res) {
        Get.dialog(AlertDialog(
            title: Text("Se ha creado el cupon"),
            content: Text(
                "El cupón ${this._tituloCupon} ahora esta desde ahora disponible hasta ${this._fechaLimite}"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("ok"))
            ]));
      }
    } else {
      Get.dialog(AlertDialog(
          title: Text("No ha sido posible crear el cupón ${this._tituloCupon}"),
          content: Text("Por favor rellene todos los campos"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("ok"))
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
