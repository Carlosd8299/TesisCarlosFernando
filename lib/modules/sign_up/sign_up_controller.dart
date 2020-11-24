import 'package:get/get.dart';
import 'package:itsuit/data/models/actividad_economica.dart';
import 'package:itsuit/data/models/regimen_tributario.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/modules/login/login_screen.dart';
import 'package:itsuit/modules/sign_up/Sign_up_empresa.dart';
import 'package:itsuit/modules/sign_up/sign_up_proveedor.dart';

class SignUpController extends GetxController {
  String _nombre_cliente;
  int _selected_tributario = 1;
  int _tipo_documento_proveedor = 1;
  int _selected_act_eco_proveedor = 1;
  List<Regimen> _regimenes = [];
  List<ActividadEco> _actividades = [];
  final ApiRepository _apirepo = Get.find<ApiRepository>();

  List<Regimen> get getRegimenes => _regimenes;
  List<ActividadEco> get getActividades => _actividades;
  int get getRegimenTributario => this._selected_tributario;
  int get getTipoDocumentoProveedor => this._tipo_documento_proveedor;
  int get getActEconomicaProveedor => this._selected_act_eco_proveedor;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print(" readyHola");
    this.loadRegimenes();
    this.loadActEco();
  }

  onNombreClieneChanged(String value) {
    this._nombre_cliente = value;
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
}
