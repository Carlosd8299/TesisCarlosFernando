import 'package:get/get.dart';
import 'package:itsuit/data/models/Categorias.dart';
import 'package:itsuit/data/models/Servicios.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/data/provider/local/local_auth.dart';
import 'package:itsuit/data/repositories/remote/Api_repository.dart';
import 'package:flutter/material.dart';

class AddCategoriesController extends GetxController {
  final ApiRepository _apirepo = Get.find<ApiRepository>();
  RequestToken _r;
  int _selectedIndexCategoria = 1;
  int idCategoria;
  List<Categoria> _categorias = [];
  List<Categoria> _categoriasProveedor = [];

  // Metodos Get

  List<Categoria> get getCategorias => this._categorias;
  List<Categoria> get getCategoriasProveedor => this._categoriasProveedor;

  int get getSelectedCategoria => this._selectedIndexCategoria;

// Obtener las categorias del end point
  Future<void> loadCategorias() async {
    final data = await _apirepo.getCategorias();
    _categorias = data.data;
    update(['categorias']);
  }

// Obtener las categorias proveedor
  Future<void> loadCategoriasProveedor() async {
    final data =
        await _apirepo.consultarCategoriasProveedor(this._r.usuario.idTercero);
    _categoriasProveedor = data;
    update(['categorias_proveedor']);
  }

  Future<void> onCategoriaChanged(int value) async {
    if (value != null) {
      this.idCategoria = value;
      this._selectedIndexCategoria = value;
      update(['categorias']);
    }
  }

// Obetner los servisios del en point dada una categoria
  onCategoriaSubmited() {
    if (_selectedIndexCategoria != 0) {
      _apirepo.addCategoriasProveedor(
          _r.usuario.idTercero, _selectedIndexCategoria);
    }
  }

  @override
  void onInit() async {
    this._r = await LocalAuth().getSession();
    this.loadCategorias();
    this.loadCategoriasProveedor();
    super.onInit();
  }
}
