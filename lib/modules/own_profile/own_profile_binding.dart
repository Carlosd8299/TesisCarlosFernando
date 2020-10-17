import 'package:get/get.dart';
import 'package:itsuit/modules/own_profile/own_profile_controller.dart';

class OwnProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OwnProfileController());
  }
}
