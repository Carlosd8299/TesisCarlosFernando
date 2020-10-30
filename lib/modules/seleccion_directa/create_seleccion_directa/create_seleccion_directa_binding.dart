import 'package:get/get.dart';

import 'create_seleccion_directa_controller.dart';

class CreateSeleccionDirectaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateSeleccionDirectaController());
  }
}
