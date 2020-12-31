import 'package:get/get.dart';
import 'package:itsuit/modules/home/proveedor_list/proveedor_list_controller.dart';

class ProveedorListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProveedorListController());
  }
}
