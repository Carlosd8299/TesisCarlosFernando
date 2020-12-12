import 'package:get/get.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/models/trabajo_realizado.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ListDoneJobController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  Proveedor _proveedor;
  RequestToken r;
  int _tipoUsuario;

  int get getTipoUsuario => _tipoUsuario;
  List<TrabajoRealizado> _listTrabajos = [];
  List<TrabajoRealizado> get getPortafolio => _listTrabajos;

  Future<void> loadListTrabajoRealizado() async {
    _listTrabajos = await _apirepo.consultarPortafolio(_proveedor.id);
    if (_listTrabajos == null) {
      _listTrabajos = [];
    }

    if (_tipoUsuario == 1) {
      update(['listPortafolio']);
    } else {
      update(['listPortafolioA']);
    }
  }

  @override
  void onInit() async {
    _proveedor = Get.arguments[0] as Proveedor;
    _tipoUsuario = Get.arguments[1] as int;
    await loadListTrabajoRealizado();
    super.onInit();
  }
}
