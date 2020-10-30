import 'package:get/get.dart';

import 'detail_proceso_controller.dart';

class DetailProcesoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailProcesoController());
  }
}
