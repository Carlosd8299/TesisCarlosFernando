import 'package:get/get.dart';

import 'list_done_jobs_controller.dart';

class ListDoneJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListDoneJobController());
  }
}
