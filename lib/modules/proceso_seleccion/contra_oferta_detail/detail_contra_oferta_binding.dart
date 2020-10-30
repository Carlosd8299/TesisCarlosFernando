import 'package:get/get.dart';
import 'detail_contra_oferta_controller.dart';

class DetailContraOfertaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailContraOfertaController());
  }
}
