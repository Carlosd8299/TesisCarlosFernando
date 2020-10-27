import 'package:get/get.dart';

import 'detail_done_job_controller.dart';

class DetailsDoneJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsDoneJobController());
  }
}
