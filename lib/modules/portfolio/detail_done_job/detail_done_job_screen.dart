import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/detail_cupon/detail_cupon_controller.dart';
import 'package:itsuit/widgets/switcher.dart';
import 'package:itsuit/widgets/widgets.dart';

import 'detail_done_job_controller.dart';

class DetailsDoneJobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsDoneJobController>(
      builder: (_) =>
          Switcher(DetailsDoneJobProveedor(), DetailsDoneJobEmpresa(), 1),
    );
  }
}

class DetailsDoneJobProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsDoneJobController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            //AppBar
            CustomAppBar(
              onTap: () => print(""),
              title: 'Nombre del cupon asociado',
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.attach_money,
                      ),
                      Text(
                        "20.000.000",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 17),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "10.000.000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.room_service,
                      ),
                      Column(
                        children: [
                          Text(
                            "Servicio Asociado",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "Nombre del servicio asociado",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.access_time,
                      ),
                      Column(
                        children: [
                          Text(
                            "Fecha limite de redencion",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "Fecha limite de redencion",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.view_quilt,
                      ),
                      Column(
                        children: [
                          Text(
                            "Categorias asociadas",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "Categorias asociadas",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.local_offer,
                      ),
                      Column(
                        children: [
                          Text(
                            "Porcentaje de descuento",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "Porcentaje de descuento",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Descripcion del cupon",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        "Descripcion larga del cupon Descripcion larga del cuponDescripcion larga del cuponDescripcion larga del cuponDescripcion larga del cuponDescripcion larga del cuponDescripcion larga del cupon",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Eliminar cupon",
            instruction:
                "Elimina el cupon, las personas que ya lo escogieron no se les eliminara.",
            onTap: () => print("Hola"),
            icon: Icon(Icons.delete),
            color: Colors.black),
      ),
    );
  }
}

class DetailsDoneJobEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsDoneJobController>(
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            //AppBar
            CustomAppBar(
              onTap: () => print(""),
              title: 'Nombre del cupon asociado',
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.attach_money,
                      ),
                      Text(
                        "20.000.000",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 17),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "10.000.000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.room_service,
                      ),
                      Column(
                        children: [
                          Text(
                            "Servicio Asociado",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "Nombre del servicio asociado",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.access_time,
                      ),
                      Column(
                        children: [
                          Text(
                            "Fecha limite de redencion",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "Fecha limite de redencion",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.view_quilt,
                      ),
                      Column(
                        children: [
                          Text(
                            "Categorias asociadas",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "Categorias asociadas",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleGradientButton(
                        icon: Icons.local_offer,
                      ),
                      Column(
                        children: [
                          Text(
                            "Porcentaje de descuento",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            "Porcentaje de descuento",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Descripcion del cupon",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        "Descripcion larga del cupon Descripcion larga del cuponDescripcion larga del cuponDescripcion larga del cuponDescripcion larga del cuponDescripcion larga del cuponDescripcion larga del cupon",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
