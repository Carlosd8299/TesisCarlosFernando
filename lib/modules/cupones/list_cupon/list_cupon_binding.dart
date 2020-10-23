import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/list_cupon/list_cupon_controller.dart';

class ListCuponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListCuponController());
  }
}
