import 'package:get/get.dart';

import 'list_historico_controller.dart';

class ListHistoricoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListHistoricoController());
  }
}
