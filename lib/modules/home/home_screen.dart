import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/request_token.dart';
import 'package:itsuit/modules/home/home_controller.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (_) => Switcher(
            HomeProveedor(
              usuario: _.r.usuario,
            ),
            HomeEmpresa(),
            _.r.usuario.idTipoUsuario));
  }
}

class HomeProveedor extends StatelessWidget {
  final Usuario usuario;
  const HomeProveedor({Key key, @required this.usuario}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Encuentra ofertas y aplica para conseguir la licitacion",
                style: (Theme.of(context).textTheme.headline1),
              ),
              SizedBox(
                height: 20,
              ),
              SearchBar(
                hint: "Digite el tipo de servicio que desea buscar",
                width: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Licitaciones recomendadas",
                style: (Theme.of(context).textTheme.headline1),
              ),
              SizedBox(
                height: 20,
              ),
              CardRecomended(
                isProveedor: true,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Solicitudes abiertas",
                style: (Theme.of(context).textTheme.headline1),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 500,
                height: 150,
                child: ListView(
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SmallCard(
                      title: "Hola",
                      subtitle: "Hola",
                      color: Constants.colorlist[1],
                    ),
                    SmallCard(
                      title: "Holaaaaa",
                      subtitle: "Holaaaaa",
                      color: Constants.colorlist[2],
                    ),
                    SmallCard(
                      title: "Servicio",
                      subtitle: "Servicio",
                      color: Constants.colorlist[3],
                    ),
                    SmallCard(
                      title: "Nombre de la categoria",
                      subtitle: "Cantidad de solciitudes",
                      color: Constants.colorlist[4],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Encuentra proveedores de servicios de TI",
                style: (Theme.of(context).textTheme.headline1),
              ),
              SizedBox(
                height: 20,
              ),
              SearchBar(
                hint: "Digite el tipo de servicio que desea buscar",
                width: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Proveedores mejor calificados",
                style: (Theme.of(context).textTheme.headline1),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 500,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardRecomended(isProveedor: false),
                    CardRecomended(isProveedor: false),
                    CardRecomended(isProveedor: false),
                    CardRecomended(isProveedor: false),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Proveedores por categorias",
                style: (Theme.of(context).textTheme.headline1),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 500,
                height: 150,
                child: ListView(
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SmallCard(
                      title: "Diseño UI/UX",
                      subtitle: "150 Proveedores",
                      color: Constants.colorlist[0],
                    ),
                    SmallCard(
                      title: "COnsultoria en SI",
                      subtitle: "150 Proveedores",
                      color: Constants.colorlist[1],
                    ),
                    SmallCard(
                      title: "Seguridad informatica",
                      subtitle: "150 Proveedores",
                      color: Constants.colorlist[2],
                    ),
                    SmallCard(
                      title: "Desarrollo web",
                      subtitle: "150 Proveedores",
                      color: Constants.colorlist[3],
                    ),
                    SmallCard(
                      title: "Redes",
                      subtitle: "150 Proveedores",
                      color: Constants.colorlist[4],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
