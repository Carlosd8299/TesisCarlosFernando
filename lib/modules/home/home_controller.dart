import 'package:get/get.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/SolicitudCategorias.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/local/local_auth_repository.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/data/repositories/remote/auth_repository.dart';
import 'package:itsuit/modules/login/login_controller.dart';
import 'package:itsuit/routes/my_routes.dart';

class HomeController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  int idtipo;
  RequestToken r;
  // Datos para el proveedor
  // ignore: non_constant_identifier_names
  List<Datum> _SolicitudCategorias = [];
  List<ProcesoSeleccion> _solicitudesRecomendadas = [];
  List<Datum> get getListCantSolicitudesCategoria => _SolicitudCategorias;
  List<ProcesoSeleccion> get getListSolicitudesRecomendadas =>
      _solicitudesRecomendadas;

  // Datos para el solicitante
  List<Proveedor> _listProveedores = [];
  List<Datum> _proveedorCategorias = [];
  List<Proveedor> get getListProveedores => _listProveedores;
  List<Datum> get getProveedorCategorias => _proveedorCategorias;

  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<void> logOut() async {
    await _localAuthRepository.clearSession();
    Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
  }

  Future<void> loadCantSolicitudesCategoria() async {
    final data = await _apirepo.getListCantSolicitudesCategoria();
    if (data != null) {
      _SolicitudCategorias = data.data;
      update(['SolicitudCategorias']);
    } else {
      throw Error();
    }
  }

  Future<void> loadCantProveedorCategoria() async {
    final data = await _apirepo.getListCantProveedorCategoria();
    if (data != null) {
      _proveedorCategorias = data.data;
      update(['ProveedorCategorias']);
    } else {
      throw Error();
    }
  }

  Future<void> loadSolicitudesRecomendadas() async {
    final data = await _apirepo.getListSolicitudes();
    if (data != null) {
      _solicitudesRecomendadas = data.data;
      update(['recommendedSolicitud']);
    } else {
      throw Error();
    }
  }

  Future<void> loadProveedores() async {
    final data = await _apirepo.getListProveedores();

    if (data != null) {
      _listProveedores = data.data;
      update(['recommendedProveedor']);
    } else {
      throw Error();
    }
  }

  get getR => r;
  get getIdTipo => idtipo;
  @override
  void onInit() async {
    r = Get.arguments as RequestToken;
    idtipo = r.usuario.idTipoUsuario;
    try {
      if (idtipo == 1) {
        await this.loadCantSolicitudesCategoria();
        await this.loadSolicitudesRecomendadas();
      } else {
        await this.loadProveedores();
        await this.loadCantProveedorCategoria();
      }
    } catch (err) {}
    super.onInit();
  }
}
