import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/proceso_seleccion/components/label.dart';
import 'package:itsuit/modules/proceso_seleccion/contra_oferta_create/create_contra_oferta_controller.dart';
import 'package:itsuit/widgets/sliverAppBar.dart';
import '../../screens.dart';

class CreateContraOfertaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateContraOfertaController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                title: 'ContraOfertar',
                onTap: () => Get.to(DetailOfertaScreen())),
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
                        function: (value) =>
                            {controller.onDescripcionChanged(value)},
                        maxlines: 4,
                        label: 'Escribir comentario sobre la oferta',
                        hint:
                            'Déjale un mensaje al proveedor con relacion a la oferta propuesta para este proceso de selección'))),
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverToBoxAdapter(
                    child: CustomField(
                        function: (value) => {controller.onPlazoChanged(value)},
                        maxlines: 4,
                        label:
                            'Escribe el plazo máximo en dias para responder a esta contraoferta',
                        hint: '10 '))),
            //Boton de enviar mensaje
            SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 150),
                sliver: SliverToBoxAdapter(
                    child: InkWell(
                        onTap: () =>
                            {controller.crearContraOferta(), Get.back()},
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
          ],
        ),
      ),
    );
  }
}
