import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ProcesoListController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;

  List<ProcesoSeleccion> _listProcesosDeSeleccion = [];

  List<ProcesoSeleccion> get getListProcesosSeleccion =>
      _listProcesosDeSeleccion;

  void loadSolcitudes() async {
    final data = await _apirepo.getSolicitudes(r.usuario.idTercero);
    _listProcesosDeSeleccion = data.data;
    update(['listaSolicitudes']);
  }

  @override
  void onInit() async {
    r = Get.arguments as RequestToken;
    this.loadSolcitudes();
    super.onInit();
  }
}
