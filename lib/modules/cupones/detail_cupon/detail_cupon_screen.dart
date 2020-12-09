import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/data/models/cupon.dart';
import 'package:itsuit/modules/cupones/detail_cupon/detail_cupon_controller.dart';
import 'package:itsuit/routes/my_routes.dart';
import 'package:itsuit/widgets/switcher.dart';
import 'package:itsuit/widgets/widgets.dart';

class DetailsCuponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsCuponController>(
      builder: (_) => Switcher(DetailsCuponProveedor(cupon: _.getCupon),
          DetailsCuponEmpresa(cupon: _.getCupon), _.geTipoUser),
    );
  }
}

class DetailsCuponProveedor extends StatelessWidget {
  final Cupon cupon;

  const DetailsCuponProveedor({Key key, @required this.cupon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsCuponController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            //AppBar
            CustomAppBar(
              onTap: () => Get.back(),
              title: cupon.titulo,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.attach_money,
                        ),
                        SizedBox(width: 10),
                        Text(
                          cupon.precioNormal.toString(),
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 17),
                        ),
                        SizedBox(width: 5),
                        Text(
                          cupon.precioDescuento.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.room_service,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Servicio Asociado",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.nombreServicio,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.access_time,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fecha limite de redencion",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.fechaFin.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.view_quilt,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Categoria asociada",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.nombreCategoria,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.local_offer,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Porcentaje de descuento",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.porcentajeDescuento.toString() + "%",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.message,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Descripcion del cupon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.descripcion,
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Eliminar cupon",
            instruction:
                "Elimina el cupon, las personas que ya lo escogieron no se les eliminara.",
            onTap: () => {},
            icon: Icon(Icons.delete),
            color: Colors.black),
      ),
    );
  }
}

class DetailsCuponEmpresa extends StatelessWidget {
  final Cupon cupon;

  const DetailsCuponEmpresa({Key key, this.cupon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsCuponController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            //AppBar
            CustomAppBar(
              onTap: () => Get.back(),
              title: cupon.titulo,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.attach_money,
                        ),
                        SizedBox(width: 10),
                        Text(
                          cupon.precioNormal.toString(),
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 17),
                        ),
                        SizedBox(width: 5),
                        Text(
                          cupon.precioDescuento.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.room_service,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Servicio Asociado",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.nombreServicio,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.access_time,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fecha limite de redencion",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.fechaFin.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.view_quilt,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Categoria asociada",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.nombreCategoria,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.local_offer,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Porcentaje de descuento",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.porcentajeDescuento.toString() + "%",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleGradientButton(
                          icon: Icons.message,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Descripcion del cupon",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              cupon.descripcion,
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
