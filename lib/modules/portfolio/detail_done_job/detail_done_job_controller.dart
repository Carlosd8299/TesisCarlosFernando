import 'package:get/get.dart';
import 'package:itsuit/data/models/trabajo_realizado.dart';

class DetailsDoneJobController extends GetxController {
  TrabajoRealizado _trabajoRealizado;

  get getTrabajoRealizado =>
      _trabajoRealizado != null ? _trabajoRealizado : false;

  @override
  void onInit() {
    _trabajoRealizado = Get.arguments[0] as TrabajoRealizado;
    super.onInit();
  }
}
