import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class CreateCuponController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();

  String _tituloCupon, _descripCupon, _fechaLimite;
  int _porcentajeCupon, _selectedIndexCategoria = 1, _selectedIndexServicio = 1;
  double _precioCupon;
  int idCategoria;
  int idServicio;
  List<Categoria> _categorias = [];
  List<Servicio> _servicios = [];

  // Metodos Get

  List<Categoria> get getCategorias => this._categorias;

  List<Servicio> get getServicios => this._servicios;

  int get getSelectedCategoria => this._selectedIndexCategoria;

  int get getSelectedServicio => this._selectedIndexServicio;

// Obtener las categorias del end point
  Future<void> loadCategorias() async {
    final data = await _apirepo.getCategorias();
    _categorias = data.data;
    update(['categorias']);
  }

  Future<void> onCategoriaChanged(int value) async {
    if (value != null) {
      this.idCategoria = value;
      this._selectedIndexCategoria = value;
      await this.loadServicios();
    }
  }

  void onServicioChanged(int value) {
    if (value != null) {
      this.idServicio = value;
      this._selectedIndexServicio = value;
    }
  }

// Obetner los servisios del en point dada una categoria
  loadServicios() async {
    final data = await _apirepo.getServicios(this.idCategoria);
    _servicios = data.data;
    update(['servicios']);
  }

  onTituloCuponChanged(String value) {
    _tituloCupon = value;
  }

  onDescripCuponChanged(String value) {
    _descripCupon = value;
  }

  onPrecioCuponChanged(String value) {
    _precioCupon = double.parse(value);
  }

  onPorcentajeCuponChanged(String value) {
    _porcentajeCupon = int.parse(value);
  }

  onFechaLimiteCuponChanged(String value) {
    _fechaLimite = value;
  }

  @override
  void onInit() {
    this.loadCategorias();
    super.onInit();
  }
}
