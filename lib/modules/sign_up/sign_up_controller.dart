import 'package:get/get.dart';
import 'package:itsuit/modules/sign_up/Sign_up_empresa.dart';
import 'package:itsuit/modules/sign_up/sign_up_proveedor.dart';

class SignUpController extends GetxController {
  String _nombre_cliente;
  onNombreClieneChanged(String value) {
    _nombre_cliente = value;
  }

  goToRegistroProveedor() {
    Get.to(SignUpProveedor());
  }

  goToRegistroEmpresa() {
    Get.to(SignUpEmpresa());
  }
}
