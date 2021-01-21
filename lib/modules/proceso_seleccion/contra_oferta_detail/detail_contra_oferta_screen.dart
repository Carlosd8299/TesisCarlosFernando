import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/components/colored_button.dart';
import 'package:itsuit/modules/proceso_seleccion/contra_oferta_detail/detail_contra_oferta_controller.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';
import 'package:itsuit/widgets/widgets.dart';
import '../../screens.dart';

class DetailContraOferta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailContraOfertaController>(
      builder: (controller) => Switcher(DetailContraOfertaProveedorScreen(),
          DetailContraOfertaEmpresaScreen(), 1),
    );
  }
}

class DetailContraOfertaProveedorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailContraOfertaController>(
      builder: (_) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(title: 'Contraoferta', onTap: () => {Get.back()}),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedIconButton(
                    function: () => _.aprobarOferta(),
                    color: Constants.greenflatbutton,
                    label: 'Aceptar',
                    icon: (FontAwesomeIcons.check),
                  ),
                  RoundedIconButton(
                    function: () => _.rechazarOferta(),
                    color: Constants.redflatbutton,
                    label: 'Rechazar',
                    icon: (FontAwesomeIcons.times),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contraoferta",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "",
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
                      "Descripción de la oferta",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      _.contraOferta.descripcion,
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
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Cuenta con " +
                      _.contraOferta.plazo.toString() +
                      " dias par aceptar o rechazar esta contraoferta.",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailContraOfertaEmpresaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailContraOfertaController>(
      builder: (_) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                title: 'Contraoferta',
                onTap: () => Get.to(DetailOfertaScreen())),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedIconButton(
                    function: () => _.aprobarOferta(),
                    color: Constants.greenflatbutton,
                    label: 'Aceptar',
                    icon: (FontAwesomeIcons.check),
                  ),
                  RoundedIconButton(
                    function: () => _.rechazarOferta(),
                    color: Constants.redflatbutton,
                    label: 'Rechazar',
                    icon: (FontAwesomeIcons.times),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contraoferta",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "",
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
                      "Descripción de la oferta",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      _.contraOferta.descripcion,
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
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Cuenta con " +
                      _.contraOferta.plazo.toString() +
                      " dias par aceptar o rechazar esta contraoferta.",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
