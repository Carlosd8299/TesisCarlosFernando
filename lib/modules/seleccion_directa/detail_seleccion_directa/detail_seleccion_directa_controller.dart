import 'package:get/get.dart';
import 'package:itsuit/data/models/Proceso_Seleccion.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class DetailSeleccionDirectaController extends GetxController {
  ProcesoSeleccion proceso;
  RequestToken r;
  bool _botonActivado = true;
  int tipoUsuario;
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  bool get getbotnActivado => _botonActivado;
  int get getTipoUsuario => tipoUsuario;
  cambioEstadoSolicitud(int estado) async {
    await _apirepo.cambioEstadoSolicitud(proceso.id, estado);
  }

  aprobarSolicitud() {
    if (proceso.estado != 3 && proceso.estado != 4) {
      cambioEstadoSolicitud(4);
      proceso.estado = 4;
    }
  }

  rechazarSolicitud() {
    if (proceso.estado != 3 && proceso.estado != 4) {
      cambioEstadoSolicitud(3);
      proceso.estado = 3;
    }
  }

  @override
  void onInit() async {
    proceso = Get.arguments[0] as ProcesoSeleccion;
    tipoUsuario = Get.arguments[1] as int;
    r = await LocalAuth().getSession();
    if (proceso.estado != 3 && proceso.estado != 4) {
      _botonActivado = true;
    } else {
      _botonActivado = true;
    }
    super.onInit();
  }
}
