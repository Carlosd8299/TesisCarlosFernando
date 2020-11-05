import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/repositories/local/local_auth_repository.dart';
import 'package:itsuit/modules/login/login_controller.dart';
import 'package:itsuit/routes/my_routes.dart';

class HomeController extends GetxController {
  int idtipo;
  RequestToken r;
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  Future<void> logOut() async {
    await _localAuthRepository.clearSession();
    Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
  }

  get getR => r;
  get getIdTipo => idtipo;

  @override
  void onInit() {
    // idtipo = Get.arguments as int;
    r = Get.arguments as RequestToken;
    super.onInit();
  }
}
