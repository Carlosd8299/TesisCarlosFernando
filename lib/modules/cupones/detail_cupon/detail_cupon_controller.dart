import 'package:get/get.dart';
import 'package:itsuit/data/models/cupon.dart';

class DetailsCuponController extends GetxController {
  Cupon _cupon;
  int _tipoUser;

  Cupon get getCupon => _cupon;
  int get geTipoUser => _tipoUser;

  @override
  void onInit() {
    _cupon = Get.arguments[0] as Cupon;
    _tipoUser = Get.arguments[1] as int;
    super.onInit();
  }
}
