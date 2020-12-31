import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ListSeleccionDirectaController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;
  int tipoUsuario;
  List<ProcesoSeleccion> _listProcesosDeSeleccion = [];

  List<ProcesoSeleccion> get getListProcesosSeleccion =>
      _listProcesosDeSeleccion;

  void loadSolcitudes() async {
    final data = await _apirepo.getListSolicitudesDirectas(
        r.usuario.idTipoUsuario, r.usuario.idTercero);
    _listProcesosDeSeleccion = data.data;
    update(['listSeleccionDirecta']);
  }

  @override
  void onInit() async {
    r = await LocalAuth().getSession();
    tipoUsuario = r.usuario.idTipoUsuario;
    this.loadSolcitudes();
    super.onInit();
  }
}
