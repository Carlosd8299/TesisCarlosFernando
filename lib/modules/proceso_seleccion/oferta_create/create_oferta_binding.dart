import 'package:get/get.dart';

import 'create_oferta_controller.dart';

class CreateOfertaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateOfertaController());
  }
}
