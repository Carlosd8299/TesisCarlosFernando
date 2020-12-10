import 'package:get/get.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/models/trabajo_realizado.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ListHistoricoController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  Proveedor _proveedor;
  RequestToken r;

  List<TrabajoRealizado> _listTrabajos = [];
  List<TrabajoRealizado> get getPortafolio => _listTrabajos;

  Future<void> loadListTrabajoRealizado() async {
    _listTrabajos = await _apirepo.consultarHistorico(_proveedor.id);
    update(['listPortafolio']);
  }

  @override
  void onInit() async {
    _proveedor = Get.arguments as Proveedor;
    r = await LocalAuth().getSession();
    await loadListTrabajoRealizado();
    super.onInit();
  }
}
