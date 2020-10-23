import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/detail_cupon/detail_cupon_controller.dart';

class DetailsCuponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsCuponController());
  }
}
