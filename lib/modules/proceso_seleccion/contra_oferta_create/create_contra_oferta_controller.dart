import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:itsuit/data/models/Ofertas.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class CreateContraOfertaController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;
  Oferta oferta;
  int _idTipoUsurio;
  int plazo;
  String descripcion;
  int get getTipoUsuario => _idTipoUsurio;

  onPlazoChanged(String value) {
    this.plazo = int.parse(value.trim());
  }

  onDescripcionChanged(String value) {
    this.descripcion = value.trim();
  }

  Future<void> crearContraOferta() async {
    bool response = await _apirepo.createContraOferta(
        this.oferta.idRespuesta,
        (new DateFormat("yyyy-MM-dd").format(new DateTime.now())).toString(),
        plazo,
        descripcion);
  }

  @override
  void onInit() async {
    oferta = Get.arguments[0] as Oferta;
    _idTipoUsurio = Get.arguments[1] as int;
    this.r = await LocalAuth().getSession();
    super.onInit();
  }
}
