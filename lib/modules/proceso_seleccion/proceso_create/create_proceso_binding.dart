import 'package:get/get.dart';

import 'create_proceso_controller.dart';

class CreateProcesoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateProcesoController());
  }
}
