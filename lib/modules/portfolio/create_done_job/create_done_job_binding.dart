import 'package:get/get.dart';

import 'create_done_job_controller.dart';

class CreateDoneJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateDoneJobController());
  }
}
