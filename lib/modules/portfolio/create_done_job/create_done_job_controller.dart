import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';

class CreateDoneJobController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken _r;
  int _selectedIndexCategoria = 1, _selectedIndexServicio = 1;
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
      update(['categorias']);
    }
  }

  void onServicioChanged(int value) {
    if (value != null) {
      this.idServicio = value;
      this._selectedIndexServicio = value;
      update(['servicios']);
    }
  }

// Obetner los servisios del en point dada una categoria
  loadServicios() async {
    final data = await _apirepo.getServicios(this.idCategoria);
    _servicios = data.data;
    update(['servicios']);
  }

  @override
  void onInit() async {
    this._r = await LocalAuth().getSession();
    this.loadCategorias();
    super.onInit();
  }
}
