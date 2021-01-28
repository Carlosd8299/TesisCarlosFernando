import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/ProveedorAplicoOferta.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class DetailProcesoController extends GetxController {
  ProcesoSeleccion _proceso;
  int _idTipoUsuario;
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  final LocalAuth localAuth = new LocalAuth();
  bool proveedorAplico = false;
  RequestToken requestToken;
  List<ProveedorOferta> _listProveedores = [];
  ProcesoSeleccion get getProceso => _proceso;
  int get getTipoUsuario => _idTipoUsuario;
  List<ProveedorOferta> get getListProveedores => _listProveedores;

  Future<void> loadProveedores() async {
    ProveedorAplicoOferta response =
        await _apirepo.consultarProveedorSolicitud(_proceso.id);
    if (response != null) {
      _listProveedores = response.data;
      if (_listProveedores.length > 0) {
        bool res = this.busqueda();
        if (res) {
          proveedorAplico = res;
          update(['nav']);
          print("aplicó");
        }
      }
      update(['listProveedorAplica']);
    }
  }

  bool busqueda() {
    ProveedorOferta objeto = this._listProveedores.firstWhere(
        (ProveedorOferta data) =>
            data.idTercero == this.requestToken.usuario.idTercero,
        orElse: () => null);
    return (objeto != null) ? true : false;
  }

  @override
  void onInit() async {
    _proceso = Get.arguments[0] as ProcesoSeleccion;
    _idTipoUsuario = Get.arguments[1] as int;
    requestToken = await localAuth.getSession();

    if (_idTipoUsuario == 1) {
      await this.loadProveedores();
    }

    super.onInit();
  }
}
