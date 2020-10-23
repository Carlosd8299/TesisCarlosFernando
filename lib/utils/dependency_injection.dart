import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/provider/reomote/auth_api.dart';
import 'package:itsuit/data/repositories/remote/auth_repository.dart';
import 'package:itsuit/modules/login/login_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put(Dio(BaseOptions(baseUrl: "http://23.21.130.107/api/")));
    //Providers
    Get.put(AuthApi());
    //repositories
    Get.put(AuthRepository());
  }
}
