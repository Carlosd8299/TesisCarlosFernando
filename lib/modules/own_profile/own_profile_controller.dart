import 'package:get/get.dart';
import 'package:itsuit/data/models/Proveedores.dart';
import 'package:itsuit/data/models/Solicitante.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class OwnProfileController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();

  int idtipo;
  RequestToken r;
  Proveedores _proveedores = Proveedores();
  Empresa _solicitante = Empresa();
  Proveedores get getProveedor => _proveedores;
  Empresa get getSolicitante => _solicitante;

  get getR => r;
  get getIdTipo => idtipo;

  Future<void> loadSolicitante() async {
    final data = await _apirepo.getListSolicitante();
    if (data != null) {
      _solicitante = data.data[0];
      update(['cabeceraSolcitante']);
    } else {
      throw Error();
    }
  }

  @override
  void onInit() async {
    r = Get.arguments as RequestToken;
    idtipo = r.usuario.idTipoUsuario;

    if (this.idtipo == 2) {
      await this.loadSolicitante();
    }
    super.onInit();
  }
}
