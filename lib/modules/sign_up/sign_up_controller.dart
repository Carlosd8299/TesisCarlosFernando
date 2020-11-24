import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/models/ubicaciones.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/modules/login/login_screen.dart';
import 'package:itsuit/modules/sign_up/Sign_up_empresa.dart';
import 'package:itsuit/modules/sign_up/sign_up_proveedor.dart';

class SignUpController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  // Campos de textto String
  String _nombre_proveedor,
      _correo_proveedor,
      _direccion_proveedor,
      _password_proveedor,
      _confirm_password_proveedor,
      _nombre_empresa,
      _phone_proveedor,
      _id_proveedor,
      _year_registro_proveedor;

  //bool confirmas TYC
  bool _tyc_proveedor = true;
  bool _tyc_empresa = true;

  //Dropowns
  int _selected_tributario = 1;
  int _tipo_documento_proveedor = 1;
  int _selected_act_eco_proveedor = 1;
  int _selected_ciudad_proveedor = 1;

  List<Regimen> _regimenes = [];
  List<ActividadEco> _actividades = [];
  List<Ciudade> _ciudades = [];

  List<Regimen> get getRegimenes => _regimenes;
  List<ActividadEco> get getActividades => _actividades;
  List<Ciudade> get getCiudades => _ciudades;

  int get getRegimenTributario => this._selected_tributario;
  int get getTipoDocumentoProveedor => this._tipo_documento_proveedor;
  int get getActEconomicaProveedor => this._selected_act_eco_proveedor;
  int get getCiudadProveedor => this._selected_ciudad_proveedor;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print(" readyHola");
    this.loadRegimenes();
    this.loadActEco();
    this.loadCiudades();
  }

  onNombreProveedorChanged(String value) {
    this._nombre_proveedor = value;
  }

  onDireccionProveedorChanged(String value) {
    this._direccion_proveedor = value;
  }

  onCorreoProveedorChanged(String value) {
    this._correo_proveedor = value;
  }

  onNombreClienteChanged(String value) {
    this._nombre_proveedor = value;
  }

  onTipoDocumentoProveedorChanged(int value) {
    this._tipo_documento_proveedor = value;
  }

  onActEconomicaProveedorChanged(int value) {
    this._selected_act_eco_proveedor = value;
  }

  onRegimenTributarioProveedorChanged(int value) {
    this._selected_tributario = value;
  }

  onCiudadProveedorChanged(int value) {
    this._selected_ciudad_proveedor = value;
  }

  onNumeroIdProveedorChanged(String value) {
    this._id_proveedor = value;
  }

  onYearProveedorChanged(String value) {
    this._year_registro_proveedor = value;
  }

  onPhoneProveedorChanged(String value) {
    this._phone_proveedor = value;
  }

  onPasswordProveedorChanged(String value) {
    this._password_proveedor = value;
  }

  onConfirmPasswordProveedorChanged(String value) {
    this._confirm_password_proveedor = value;
  }

  onConfirmTYCProveedorChanged(bool value) {
    this._tyc_proveedor = value;
  }

  goToRegistroProveedor() {
    Get.to(SignUpProveedor());
  }

  goToRegistroEmpresa() {
    Get.to(SignUpEmpresa());
  }

  goToLogIn() {
    Get.to(LoginScreen());
  }

  Future<void> loadRegimenes() async {
    final data = await _apirepo.getRegimenes();
    _regimenes = data.lista;
  }

  Future<void> loadActEco() async {
    final data = await _apirepo.getActEco();
    _actividades = data.data;
  }

  Future<void> loadCiudades() async {
    final data = await _apirepo.getCiudades();
    _ciudades = data;
  }

  onProveedorSubmit() {
    if (_tyc_proveedor) {
      if (_confirm_password_proveedor == _password_proveedor) {
        try {} catch (e) {
          Get.dialog(AlertDialog(
              title: Text("Se ha producido un error"),
              content: Text(e.toString()),
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
            title: Text("Contraseñas no coinciden"),
            content: Text("Los campos de contraseña deben coincidir"),
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
          title: Text("Acepta los terminos y condiciones"),
          content:
              Text("Para continudar debes aceptar los terminos y condiciones"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("ok"))
          ]));
    }
  }
}
