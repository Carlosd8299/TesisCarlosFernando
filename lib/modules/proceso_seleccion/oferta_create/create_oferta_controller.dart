import 'package:get/get.dart';

class CreateOfertaController extends GetxController {

  String _titulo, _descr;
  DateTime _fechaInicioEjecucion;
  double _presupuesto;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onTituloChanged(value){
_titulo = value;
  }
  onDescChanged(value){
_descr = value;
  }
  onPresupuestoChanged(value){
_presupuesto = value;
  }
  onFechaFinEjecucionChanged(value){
_fechaInicioEjecucion = value;
  }
crearOferta(){
  
}
}
