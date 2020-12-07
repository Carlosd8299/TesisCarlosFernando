import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';

class DetailProcesoController extends GetxController {
  ProcesoSeleccion _proceso;
  int _idTipoUsuario;
  final LocalAuth localAuth = new LocalAuth();
  RequestToken requestToken;

  ProcesoSeleccion get getProceso => _proceso;
  int get getTipoUsuario => _idTipoUsuario;
  @override
  void onInit() async {
    _proceso = Get.arguments[0] as ProcesoSeleccion;
    _idTipoUsuario = Get.arguments[1] as int;
    requestToken = await localAuth.getSession();

    super.onInit();
  }
}
