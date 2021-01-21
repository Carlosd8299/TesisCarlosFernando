import 'package:get/get.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ProveedorListController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  int idtipo;
  RequestToken r;
  int idCategoria;

  List<Proveedor> _listProveedores = [];
  List<Proveedor> get getListProveedores => _listProveedores;
  get getR => r;
  get getIdTipo => idtipo;

  Future<void> loadProveedores() async {
    final data = await _apirepo.getListProveedores(false, idCategoria);

    if (data != null) {
      _listProveedores = data.data;
      update(['listProveedor']);
    } else {
      throw Error();
    }
  }

  @override
  void onInit() async {
    idCategoria = Get.arguments as int;
    loadProveedores();
    super.onInit();
  }
}
