import 'package:get/get.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/Solicitante.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';

class ProfileController extends GetxController {
  int idTipoUsuario;
  Proveedor _proveedor;
  RequestToken r;
  Solicitante _solicitante;
  Proveedor get getProveedor => _proveedor;
  Solicitante get getsolicitante => _solicitante;

  @override
  void onInit() async {
    idTipoUsuario = Get.arguments[1] as int;
    // si es 2 es un solicitante visualizando la vista si es 1 es un proveedor visualizando un Solcitante
    if (idTipoUsuario == 2) {
      _proveedor = Get.arguments[0] as Proveedor;
    } else {
      _solicitante = Get.arguments[0] as Solicitante;
    }
    r = await LocalAuth().getSession();
    super.onInit();
  }
}
