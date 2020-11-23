import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/components/colored_button.dart';
import 'package:itsuit/modules/proceso_seleccion/components/label.dart';
import 'package:itsuit/modules/proceso_seleccion/contra_oferta_detail/detail_contra_oferta_controller.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';
import 'package:itsuit/widgets/widgets.dart';
import '../../screens.dart';

class DetailContraOfertaScreen extends StatelessWidget {
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
                      color: Constants.blueflatbutton,
                      label: 'Ver la oferta',
                      icon: (FontAwesomeIcons.eye)),
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
                  "Enviar mensaje al proveedor sobre la contraoferta",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverToBoxAdapter(
                    child: CustomField(
                        maxlines: 4,
                        label: 'Escribir comentario sobre la contraoferta',
                        hint:
                            'Déjale un mensaje al proveedor con relacion a la oferta propuesta para este proceso de selección'))),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            )
          ],
        ),
        bottomNavigationBar: ButtomBottomNav(
          color: Colors.black,
          icon: Icon(FontAwesomeIcons.paperPlane),
          titleButton: 'Emitir comentario',
          instruction:
              'Déjale un mensaje al proveedor con relacion a la contraoferta propuesta para este proceso de selección',
          onTap: () => Get.to(DetailContraOfertaScreen()),
        ),
      ),
    );
  }
}
