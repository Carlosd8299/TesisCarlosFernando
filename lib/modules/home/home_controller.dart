import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';

class HomeController extends GetxController {
  RequestToken _requestToken;
  RequestToken get getToken => _requestToken;
  @override
  void onInit() {
    super.onInit();
    this._requestToken = Get.arguments as RequestToken;
  }
}
