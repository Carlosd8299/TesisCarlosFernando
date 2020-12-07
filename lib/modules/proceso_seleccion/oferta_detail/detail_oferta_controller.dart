import 'package:get/get.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:itsuit/routes/my_routes.dart';

class DetailOfertaController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;
  bool _botonActivado = true;
  Oferta oferta;
  int _idTipoUsurio;
  int get getTipoUsuario => _idTipoUsurio;
  bool get getbotnActivado => _botonActivado;

  Future<void> rechazarOferta() async {
    bool response =
        await _apirepo.cambioEstadoOferta(this.oferta.idRespuesta, 3);
    Get.offNamed(AppRoutes.DETAILPROCESO);
    _botonActivado = false;
    print(response);
  }

  Future<void> aprobarOferta() async {
    bool response =
        await _apirepo.cambioEstadoOferta(this.oferta.idRespuesta, 4);
    Get.offNamed(AppRoutes.DETAILPROCESO);
    _botonActivado = false;
  }

  @override
  void onInit() async {
    oferta = Get.arguments[0] as Oferta;
    _idTipoUsurio = Get.arguments[1] as int;
    this.r = await LocalAuth().getSession();
    _botonActivado = (oferta.estado == 3 || oferta.estado == 4) ? false : true;
    super.onInit();
  }
}
