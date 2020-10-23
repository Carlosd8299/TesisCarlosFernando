import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/create_cupon/create_cupon_controller.dart';

class CreateCuponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateCuponController());
  }
}
