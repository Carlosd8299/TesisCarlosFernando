import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';

class DetailProcesoController extends GetxController {
  ProcesoSeleccion _proceso;
  int _idTipoUsuario;

  ProcesoSeleccion get getProceso => _proceso;
  int get getTipoUsuario => _idTipoUsuario;
  @override
  void onInit() {
    _proceso = Get.arguments[0] as ProcesoSeleccion;
    _idTipoUsuario = Get.arguments[1] as int;
    super.onInit();
  }
}
