import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/models/ubicaciones.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/data/repositories/remote/auth_repository.dart';
import 'package:itsuit/routes/my_routes.dart';

class SignUpController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  final AuthRepository _authRepository = Get.find<AuthRepository>();

  // ignore: non_constant_identifier_names
  String _nombre_empresa,
      // ignore: non_constant_identifier_names
      _correo_empresa,
      // ignore: non_constant_identifier_names
      _direccion_empresa,
      // ignore: non_constant_identifier_names
      _password_empresa,
      // ignore: non_constant_identifier_names
      _confirm_password_empresa,
      // ignore: non_constant_identifier_names
      _phone_empresa,
      // ignore: non_constant_identifier_names
      _id_empresa,
      // ignore: non_constant_identifier_names
      _year_registro_empresa,
      // ignore: non_constant_identifier_names
      _cell_empresa;
  //TYC
  bool _tyc_empresa = true;
  // Dropdown empresa
  int _tipo_documento_empresa = 1;
  int _selected_tributario_empresa = 1;
  int _selected_ciudad_empresa = 3;
  int _selected_act_eco_empresa = 1;

  // Campos de textto proveedor
  String _nombre_proveedor,
      _correo_proveedor,
      _direccion_proveedor,
      _password_proveedor,
      _confirm_password_proveedor,
      _phone_proveedor,
      _id_proveedor,
      _year_registro_proveedor,
      _cell_Proveedor;

  //bool confirmas TYC
  bool _tyc_proveedor = true;

  //Dropowns proveedor
  int _selected_tributario = 1;
  int _tipo_documento_proveedor = 1;
  int _selected_act_eco_proveedor = 1;
  int _selected_ciudad_proveedor = 1;
// Experiencia del proveedor
  int _expProveedor;

  List<Regimen> _regimenes = [];
  List<ActividadEco> _actividades = [];
  List<Ciudade> _ciudades = [];

  List<Regimen> get getRegimenes => this._regimenes;
  List<ActividadEco> get getActividades => this._actividades;
  List<Ciudade> get getCiudades => this._ciudades;

  int get getRegimenTributario => this._selected_tributario;
  int get getTipoDocumentoProveedor => this._tipo_documento_proveedor;
  int get getActEconomicaProveedor => this._selected_act_eco_proveedor;
  int get getCiudadProveedor => this._selected_ciudad_proveedor;
  bool get getTycProveedor => this._tyc_proveedor;
  //
  bool get getTycEmpresa => this._tyc_empresa;
  int get getTipoDocumentoEmpresa => this._tipo_documento_empresa;
  int get getRegimenTributarioEmpresa => this._selected_tributario_empresa;
  int get getActEconomicaEmpresa => this._selected_act_eco_empresa;

  @override
  void onReady() {
    super.onReady();
    this.loadRegimenes();
    this.loadActEco();
  }

// // Metodos de Proveedor
  void onNombreProveedorChanged(String value) {
    this._nombre_proveedor = value;
  }

  void onDireccionProveedorChanged(String value) {
    this._direccion_proveedor = value;
  }

  onCellroveedorChanged(String value) {
    this._cell_Proveedor = value;
  }

  void onCorreoProveedorChanged(String value) {
    this._correo_proveedor = value;
  }

  void onTipoDocumentoProveedorChanged(int value) {
    this._tipo_documento_proveedor = value;
  }

  void onActEconomicaProveedorChanged(int value) {
    this._selected_act_eco_proveedor = value;
    update(['actEco']);
  }

  void onRegimenTributarioProveedorChanged(int value) {
    this._selected_tributario = value;
  }

  void onCiudadProveedorChanged(int value) {
    this._selected_ciudad_proveedor = value;
  }

  void onNumeroIdProveedorChanged(String value) {
    this._id_proveedor = value;
  }

  void onYearProveedorChanged(String value) {
    this._year_registro_proveedor = value;
  }

  void onPhoneProveedorChanged(String value) {
    this._phone_proveedor = value;
  }

  void onExpProveedorChanged(int value) {
    this._expProveedor = value;
  }

  void onPasswordProveedorChanged(String value) {
    this._password_proveedor = value;
  }

  void onConfirmPasswordProveedorChanged(String value) {
    this._confirm_password_proveedor = value;
  }

  void onConfirmTYCProveedorChanged(bool value) {
    this._tyc_proveedor = value;
    update(['tyc']);
  }

  // Metodos de empresaa

  void onNombreClienteChanged(String value) {
    this._nombre_empresa = value;
  }

  void onDireccionempresaChanged(String value) {
    this._direccion_empresa = value;
  }

  onCellEmpresaChanged(String value) {
    this._cell_empresa = value;
  }

  void onCorreoempresaChanged(String value) {
    this._correo_empresa = value;
  }

  void onTipoDocumentoempresaChanged(int value) {
    this._tipo_documento_empresa = value;
  }

  void onRegimenTributarioempresaChanged(int value) {
    this._selected_tributario_empresa = value;
  }

  void onActividadEconomicaEmpresaChanged(int value) {
    this._selected_act_eco_empresa = value;
  }

  void onCiudadempresaChanged(int value) {
    this._selected_ciudad_empresa = value;
  }

  void onNumeroIdempresaChanged(String value) {
    this._id_empresa = value;
  }

  void onYearempresaChanged(String value) {
    this._year_registro_empresa = value;
  }

  void onPhoneempresaChanged(String value) {
    this._phone_empresa = value;
  }

  void onPasswordempresaChanged(String value) {
    this._password_empresa = value;
  }

  void onConfirmPasswordempresaChanged(String value) {
    this._confirm_password_empresa = value;
  }

  void onConfirmTYCempresaChanged(bool value) {
    this._tyc_empresa = value;
    update(['tycempresa']);
  }

  void goToRegistroProveedor() {
    Get.offNamed(AppRoutes.SIGNUOPPROVEEDOR);
  }

  void goToRegistroEmpresa() {
    Get.offNamed(AppRoutes.SIGNUOPEMPRESA);
  }

  void goToLogIn() {
    Get.offNamed(AppRoutes.LOGIN);
  }

  /*  Future<void> loadCiudades() async {
    final data = await _apirepo.getCiudades();
    _ciudades = data.ciudades;
  }
 */
  Future<void> loadRegimenes() async {
    final data = await _apirepo.getRegimenes();
    _regimenes = data.lista;
  }

  Future<void> loadActEco() async {
    final data = await _apirepo.getActEco();
    _actividades = data.data;
  }

  void onProveedorSubmit() {
    if (_tyc_proveedor &&
        _id_proveedor != null &&
        _nombre_proveedor != null &&
        _correo_proveedor != null &&
        _phone_proveedor != null &&
        _expProveedor != 0 &&
        _cell_Proveedor != null &&
        _direccion_proveedor != null &&
        _confirm_password_proveedor != null &&
        _password_proveedor != null) {
      if (_confirm_password_proveedor == _password_proveedor) {
        try {
          _authRepository.signUpProveedor(
              idTipoDocumento: _tipo_documento_proveedor,
              idRegimenTributario: _selected_tributario,
              idActividadEconomica: _selected_act_eco_proveedor,
              dni: _id_proveedor,
              nombreTercero: _nombre_proveedor,
              fechaRegistro: "2020-01-01",
              email: _correo_proveedor,
              telefono: _phone_proveedor,
              celular: _cell_Proveedor,
              direccion: _direccion_proveedor,
              tiempoExperiencia: _expProveedor,
              password: _password_proveedor);
          Get.dialog(AlertDialog(
              title: Text("Se ha creado el usuario"),
              content: Text("Ahora puede iniciar sesion"),
              actions: [
                FlatButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("ok"))
              ]));
          Get.offNamed(AppRoutes.LOGIN);
        } catch (e) {
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
          title: Text("Todos los campos deben estar diligenciados "),
          content: Text(
              "Para continuar, tambien debes aceptar los terminos y condiciones"),
          actions: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("ok"))
          ]));
    }
  }

  void onEmpresaSubmit() {
    if (_tyc_empresa &&
        (_id_empresa != null &&
            _nombre_empresa != null &&
            _correo_empresa != null &&
            _phone_empresa != null &&
            _cell_empresa != null &&
            _direccion_empresa != null) &&
        _confirm_password_empresa != null &&
        _password_empresa != null) {
      if (_confirm_password_empresa == _password_empresa) {
        try {
          _authRepository.signUpEmpresa(
              idTipoDocumento: this._tipo_documento_empresa,
              idRegimenTributario: this._selected_tributario_empresa,
              idActividadEconomica: this._selected_act_eco_empresa,
              dni: this._id_empresa,
              nombreTercero: this._nombre_empresa,
              email: this._correo_empresa,
              telefono: this._phone_empresa,
              celular: this._cell_empresa,
              direccion: this._direccion_empresa,
              tiempoExperiencia: 1,
              password: this._password_empresa);
          /* Get.dialog(AlertDialog(
              title: Text("Se ha creado el usuario"),
              content: Text("Ahora puede iniciar sesion"),
              actions: [
                FlatButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("ok"))
              ])); */
          Get.offNamed(AppRoutes.LOGIN);
        } catch (e) {
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
          title: Text("Todos los campos deben estar diligenciados "),
          content: Text(
              "Para continuar, tambien debes aceptar los terminos y condiciones"),
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
