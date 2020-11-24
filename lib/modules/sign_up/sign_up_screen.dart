import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/login/components/fade_animation.dart';
import 'package:itsuit/modules/sign_up/sign_up_controller.dart';
import 'package:itsuit/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  CurveShape(
                    child: FadeAnimation(
                      1.5,
                      SvgPicture.asset(
                        "assets/images/2.svg",
                        width: 600,
                      ),
                    ),
                    height: 550,
                  ),
                  Positioned(
                      top: 50,
                      left: 20,
                      child: FadeAnimation(
                        2,
                        Text(
                          "Registrate \nAhora",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )),
                ]),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1.5,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        "Eres de los nuestros",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    )),
                FadeAnimation(
                    1.5,
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                          "Por eso estas aquí",
                          style: Theme.of(context).textTheme.headline3,
                        ))),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeAnimation(
                      1.5,
                      GradienButtton(
                        text: "Proveedor TIC",
                        width: 150,
                        gradient: bluegradient(),
                        onTap: () => _.goToRegistroProveedor(),
                      ),
                    ),
                    FadeAnimation(
                      1.5,
                      Container(
                        height: 47,
                        width: 150,
                        child: OutlineButton(
                            onPressed: () => _.goToRegistroEmpresa(),
                            textColor: Colors.blue,
                            borderSide: BorderSide(
                                color: Colors.blue, style: BorderStyle.solid),
                            child: Text("Empresa cliente")),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("¿Ya tienes una cuenta?"),
                        SizedBox(
                          width: 3,
                        ),
                        InkWell(
                          onTap: () => print("Registro"),
                          child: Text(
                            "Iniciar Sesión",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
