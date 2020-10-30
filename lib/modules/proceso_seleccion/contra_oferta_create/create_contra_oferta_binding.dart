import 'package:get/get.dart';

import 'create_contra_oferta_controller.dart';

class CreateContraOfertaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateContraOfertaController());
  }
}
