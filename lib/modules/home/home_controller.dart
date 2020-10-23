import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/modules/login/login_controller.dart';

class HomeController extends GetxController {
  int idtipo;
  RequestToken r;

  get getR => r;
  get getIdTipo => idtipo;

  @override
  void onInit() {
    // idtipo = Get.arguments as int;
    r = Get.arguments as RequestToken;
    super.onInit();
  }
}
