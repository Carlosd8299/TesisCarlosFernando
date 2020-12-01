import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_list/proceso_list_controller.dart';



class ProcesoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProcesoListController());
  }
}
