import 'package:get/get.dart';

import 'add_categories_proveedor_controller.dart';

class AddCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCategoriesController());
  }
}
