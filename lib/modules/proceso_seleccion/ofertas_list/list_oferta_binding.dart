import 'package:get/get.dart';

import 'list_oferta_controller.dart';

class ListOfertaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListOfertaController());
  }
}
