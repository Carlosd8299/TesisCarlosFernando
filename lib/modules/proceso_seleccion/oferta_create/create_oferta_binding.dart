import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/create_cupon/create_cupon_controller.dart';

import 'create_oferta_controller.dart';

class CreateOfertaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateOfertaController());
  }
}
