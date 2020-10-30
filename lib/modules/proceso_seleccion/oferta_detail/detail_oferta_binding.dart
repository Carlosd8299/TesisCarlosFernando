import 'package:get/get.dart';

import 'detail_oferta_controller.dart';

class DetailOfertaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailOfertaController());
  }
}
