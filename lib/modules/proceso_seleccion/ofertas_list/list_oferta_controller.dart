import 'package:get/get.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ListOfertaController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  bool isProveedor = false;
  ProcesoSeleccion _proceso;
  RequestToken requestToken;
  List<Oferta> _listOfertas = [];
  ProcesoSeleccion get getProceso => _proceso;

  List<Oferta> get getlistOfertas => _listOfertas;

  Future<void> getListOfertas([int idProveedor]) async {
    Ofertas ofertas = await _apirepo.getListOfertas(_proceso.id, idProveedor);
    _listOfertas = ofertas.data;
    update(['listOfertas']);
  }

  @override
  void onInit() async {
    _proceso = Get.arguments as ProcesoSeleccion;
    requestToken = await LocalAuth().getSession();
    if (requestToken.usuario.idTipoUsuario == 1) {
      await getListOfertas(requestToken.usuario.idTercero);
      isProveedor = true;
    } else {
      await getListOfertas();
      isProveedor = false;
    }

    super.onInit();
  }
}
