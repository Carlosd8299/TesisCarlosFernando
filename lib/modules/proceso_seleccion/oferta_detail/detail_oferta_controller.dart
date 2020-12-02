import 'package:get/get.dart';
import 'package:itsuit/data/models/Solicitudes.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class DetailOfertaController extends GetxController {
  // final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken r;

  @override
  void onReady() {
    print("ready");
  }

  @override
  void onInit() {
    print("entra");
    this.r = Get.arguments['request'] as RequestToken;
    print(Get.arguments['solcitidud'] as Solicitud);
    super.onInit();
  }
}
