import 'package:get/get.dart';
import 'package:itsuit/data/models/cupon.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class ListCuponController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken _r;
  List<Cupon> _cupones;
  int _longitudLista;

  Future<void> getListCupones() async {
    final data = await _apirepo
        .consultarCuponesProveedor(_r.usuario.idTercero)
        .then((value) {
      _longitudLista = value.length;
      _cupones = value;
    });
    update(['listacupones']);
  }

  RequestToken get getToken => _r;
  int get getLenght => _longitudLista;
  List<Cupon> get getListaCupones => this._cupones;

  @override
  void onInit() async {
    this._r = Get.arguments as RequestToken;
    await this.getListCupones();
    super.onInit();
  }
}
