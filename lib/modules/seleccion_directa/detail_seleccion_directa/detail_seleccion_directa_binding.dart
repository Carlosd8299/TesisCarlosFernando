import 'package:get/get.dart';
import 'detail_seleccion_directa_controller.dart';

class DetailSeleccionDirectaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailSeleccionDirectaController());
  }
}
