import 'package:get/get.dart';
import 'package:itsuit/data/models/Solicitudes.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ProcesoListController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;

  List<Solicitud> _ListSolcitudes = [];

  List<Solicitud> get getListSolicitudes => _ListSolcitudes;

  void loadSolcitudes() async {
    final data = await _apirepo.getSolicitudes(r.usuario.idTercero);
    _ListSolcitudes = data.data;
    update(['listaSolicitudes']);
  }

  @override
  void onInit() async {
    r = Get.arguments as RequestToken;
    this.loadSolcitudes();
    super.onInit();
  }

  @override
  void onClose() {
    print("onClose");
    super.onClose();
  }
}
