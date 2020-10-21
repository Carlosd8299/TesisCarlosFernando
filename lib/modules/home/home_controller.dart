import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';

class HomeController extends GetxController {
  int tipoUsuario;

  @override
  void onInit() {
    super.onInit();
    this.tipoUsuario = Get.arguments as int;
    print(Get.arguments);
    print(Get.toString());
    print(tipoUsuario);
  }
}
