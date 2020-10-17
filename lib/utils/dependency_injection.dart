import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/provider/reomote/auth_api.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut(() => Dio(BaseOptions(baseUrl: "http://23.21.130.107/api/")));
    Get.lazyPut<AuthApi>(() => AuthApi());
  }
}
