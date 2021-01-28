import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ProcesoListController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;
  int idCategoria;
  List<ProcesoSeleccion> _listProcesosDeSeleccion = [];

  List<ProcesoSeleccion> get getListProcesosSeleccion =>
      _listProcesosDeSeleccion;

  void loadSolcitudes() async {
    final data = await _apirepo.getSolicitudes(r.usuario.idTercero);
    if (data != null) {
      _listProcesosDeSeleccion = data.data;
    }

    update(['listaSolicitudes']);
  }

  void loadSolicitudesCategoria() async {
    final data = await _apirepo.getListSolicitudesxCategoria(this.idCategoria);
    _listProcesosDeSeleccion = data.data;
    update(['listaSolicitudes']);
  }

  @override
  void onInit() async {
    r = Get.arguments[0] as RequestToken;
    idCategoria = Get.arguments[1] as int;

    if (idCategoria != null) {
      this.loadSolicitudesCategoria();
    } else {
      this.loadSolcitudes();
    }

    super.onInit();
  }
}
