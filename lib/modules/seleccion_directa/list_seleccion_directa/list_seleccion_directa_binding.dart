import 'package:get/get.dart';

import 'list_seleccion_directa_controller.dart';

class ListSeleccionDirectaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListSeleccionDirectaController());
  }
}
