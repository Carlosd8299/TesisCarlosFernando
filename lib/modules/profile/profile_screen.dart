import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/own_profile/components/card_button_profile.dart';
import 'package:itsuit/modules/own_profile/components/social_counter.dart';
import 'package:itsuit/modules/profile/profile_controller.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/widgets/switcher.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) =>
          Switcher(ProfileProveedor(), ProfileEmpresa(), 2),
    );
  }
}

class ProfileProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(
        backgroundColor: Constants.bluelight,

        body: SingleChildScrollView(
          child: Column(
            children: [
              //Foto de perfil
              SafeArea(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    Constants.linkProviderAvatar,
                  ),
                  radius: 80,
                ),
              ),
              SizedBox(height: 20),
              //Comienza el contenedor blanco
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 400,
                height: 450,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 6,
                      offset: Offset(1, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Aqui comienza la informacion social del proveedor
                    SocialCounter(
                      isEmpresa: false,
                      firstTitle: "",
                      secondTitle: "",
                      thirdTitle: "",
                    ),
                    //Aqui comienza el menu de botones
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CardButtonProfile(
                                  color: Constants.colorlist[0],
                                  label: "Cupones",
                                  onTap: () {},
                                  icon: Icons.receipt),
                              CardButtonProfile(
                                  color: Constants.colorlist[1],
                                  label: "Servicios",
                                  onTap: () {},
                                  icon: Icons.room_service)
                            ],
                          ),
                          Row(
                            children: [
                              CardButtonProfile(
                                  color: Constants.colorlist[2],
                                  label: "Portafolio",
                                  onTap: () {},
                                  icon: Icons.card_travel),
                              CardButtonProfile(
                                  color: Constants.colorlist[3],
                                  label: "Historico de ItSuit",
                                  onTap: () {},
                                  icon: Icons.history)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //Boton bottom perfil
        bottomNavigationBar: ButtomBottomNav(
            titleButton: "Solicitud directa",
            instruction:
                "Solicitar servicio del proveedor dependiendo de los servicios que ofrece",
            onTap: () => print("Hola"),
            icon: Icon(Icons.arrow_forward),
            color: Colors.black),
      ),
    );
  }
}

//DIalogar con fernando si el proveedor va apoder ver perfil de la empresa
class ProfileEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(
        backgroundColor: Constants.bluelight,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Foto de perfil
              SafeArea(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    Constants.linkEmpresaAvatar,
                  ),
                  radius: 80,
                ),
              ),
              SizedBox(height: 20),
              //Comienza el contenedor blanco
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 400,
                height: 450,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 6,
                      offset: Offset(1, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Aqui comienza la informacion social del proveedor
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: SocialCounter(
                        isEmpresa: true,
                        firstTitle: "",
                        secondTitle: "",
                        thirdTitle: "",
                      ),
                    ),
                    //Aqui comienza el menu de botones
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CardButtonProfile(
                                  color: Constants.colorlist[0],
                                  label: "Procesos de selección",
                                  onTap: () {},
                                  icon: Icons.track_changes),
                              CardButtonProfile(
                                  color: Constants.colorlist[1],
                                  label: "Proveedores favoritos",
                                  onTap: () {},
                                  icon: Icons.bookmark)
                            ],
                          ),
                        ],
                      ),
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
