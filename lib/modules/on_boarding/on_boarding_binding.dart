import 'package:get/get.dart';
import 'package:itsuit/modules/on_boarding/on_boarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
