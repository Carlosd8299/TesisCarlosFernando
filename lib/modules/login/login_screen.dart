import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/login/login_controller.dart';
import 'package:itsuit/widgets/curve_shape.dart';
import 'package:itsuit/widgets/widgets.dart';
import 'components/fade_animation.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (_) => GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        CurveShape(
                          height: 380,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: FadeAnimation(
                                    1.6,
                                    Container(
                                      margin: EdgeInsets.only(top: 50),
                                      child: Center(
                                        child: Text(
                                          "ItSuit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FadeAnimation(
                                  1.8,
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  143, 148, 251, .2),
                                              blurRadius: 20.0,
                                              offset: Offset(0, 10))
                                        ]),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey[100]))),
                                          child: TextField(
                                            onChanged: (value) =>
                                                _.onUserNamechanged(value),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Correo Electronico",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextField(
                                            obscureText: true,
                                            onChanged: (value) =>
                                                _.onPasswordchanged(value),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Contraseña",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              FadeAnimation(
                                  2,
                                  InkWell(
                                    onTap: () => _.submit(),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: bluegradient()),
                                      child: Center(
                                        child: Text(
                                          "Iniciar Sesion",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        FadeAnimation(
                            1.5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("¿Aún no tienes una cuenta?"),
                                SizedBox(
                                  width: 3,
                                ),
                                InkWell(
                                  onTap: () => _.goToSignUp(),
                                  child: Text(
                                    "Registrate aqui",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ))));
  }
}
