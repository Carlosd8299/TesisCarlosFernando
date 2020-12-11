import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/components/colored_button.dart';
import 'package:itsuit/modules/proceso_seleccion/components/label.dart';
import 'package:itsuit/modules/proceso_seleccion/oferta_detail/detail_oferta_controller.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';
import 'package:itsuit/widgets/widgets.dart';
import '../../screens.dart';

class DetailOfertaScreen extends StatefulWidget {
  @override
  _DetailOfertaScreenState createState() => _DetailOfertaScreenState();
}

class _DetailOfertaScreenState extends State<DetailOfertaScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailOfertaController>(
      builder: (_) => Switcher(DetailOfertaScreenProveedor(),
          DetailOfertaScreenEmpresa(), _.getTipoUsuario),
    );
  }
}

class DetailOfertaScreenEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailOfertaController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                title: controller.oferta.titulo, onTap: () => Get.back()),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedIconButton(
                    function: () => {
                      controller.getbotnActivado
                          ? controller.aprobarOferta()
                          : ({})
                    },
                    color: Constants.greenflatbutton,
                    label: 'Aceptar',
                    icon: (FontAwesomeIcons.check),
                    estado: controller.getbotnActivado,
                  ),
                  RoundedIconButton(
                    function: () => {
                      controller.getbotnActivado
                          ? controller.rechazarOferta()
                          : ({})
                    },
                    color: Constants.redflatbutton,
                    label: 'Rechazar',
                    icon: (FontAwesomeIcons.times),
                    estado: controller.getbotnActivado,
                  ),
                  RoundedIconButton(
                    function: () => {
                      controller.getbotnActivado
                          ? Get.toNamed(AppRoutes.CREATECONTRAOFERTA,
                              arguments: [
                                  controller.oferta,
                                  controller.r.usuario.idTipoUsuario
                                ])
                          : ({})
                    },
                    color: Constants.yellowflatbutton,
                    label: 'Contraofertar',
                    icon: (FontAwesomeIcons.gavel),
                    estado: controller.getbotnActivado,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Descripción de la oferta",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      controller.oferta.descripcion,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Presupuesto ofertado",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      controller.oferta.valor.toString(),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fecha de ejecución de lo ofertado",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      controller.oferta.fecha.toString(),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ButtomBottomNav(
            color: Colors.black,
            icon: Icon(FontAwesomeIcons.gavel),
            titleButton: 'Ver contraofertas',
            instruction: 'Ver las contraofertas relacionadas a esta oferta',
            onTap: () => Get.toNamed(AppRoutes.DETAILCONTRAOFERTA)),
      ),
    );
  }
}

class DetailOfertaScreenProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailOfertaController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                title: "Nombre de la oferta",
                onTap: () => Get.to(ListOfertaScreen())),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedIconButton(
                    function: () => print("Hello"),
                    color: Constants.greenflatbutton,
                    label: 'Aceptar',
                    icon: (FontAwesomeIcons.check),
                  ),
                  RoundedIconButton(
                    function: () => print("Hello"),
                    color: Constants.redflatbutton,
                    label: 'Rechazar',
                    icon: (FontAwesomeIcons.times),
                  ),
                  RoundedIconButton(
                    function: () => print("Hello"),
                    color: Constants.yellowflatbutton,
                    label: 'Contraofertar',
                    icon: (FontAwesomeIcons.gavel),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Descripción de la oferta",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et.",
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Presupuesto ofertado",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet.",
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fecha de ejecución de lo ofertado",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet.",
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Enviar mensaje al proveedor sobre la oferta",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverToBoxAdapter(
                    child: CustomField(
                        function: (value) => {},
                        maxlines: 4,
                        label: 'Escribir comentario sobre la oferta',
                        hint:
                            'Déjale un mensaje al proveedor con relacion a la oferta propuesta para este proceso de selección'))),
            //Boton de enviar mensaje
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 150),
                sliver: SliverToBoxAdapter(
                    child: InkWell(
                        onTap: () => print(""),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Enviar',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 1),
                              Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: FaIcon(FontAwesomeIcons.paperPlane)),
                            ],
                          ),
                        )))),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            )
          ],
        ),
        bottomNavigationBar: ButtomBottomNav(
          color: Colors.black,
          icon: Icon(FontAwesomeIcons.gavel),
          titleButton: 'Ver contraofertas',
          instruction: 'Ver las contraofertas relacionadas a esta oferta',
          onTap: () => Get.toNamed(AppRoutes.DETAILCONTRAOFERTA),
        ),
      ),
    );
  }
}
