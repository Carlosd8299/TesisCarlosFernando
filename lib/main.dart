import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:itsuit/modules/home/home_controller.dart';
import 'package:itsuit/modules/home/home_screen.dart';
import 'package:itsuit/modules/login/login_binding.dart';
import 'package:itsuit/modules/login/login_screen.dart';
import 'package:itsuit/modules/proceso_seleccion/proceso_create/create_proceso_screen.dart';
import 'package:itsuit/modules/profile/profile_screen.dart';
import 'package:itsuit/modules/screens.dart';
import 'package:itsuit/routes/my_pages.dart';
import 'package:itsuit/utils/constants.dart';
import 'package:itsuit/utils/dependency_injection.dart';

import 'modules/cupones/create_cupon/create_cupon_screen.dart';
import 'modules/cupones/detail_cupon/detail_cupon_screen.dart';
import 'modules/cupones/list_cupon/list_cupon_screen.dart';
import 'modules/portfolio/create_done_job/create_done_job_screen.dart';
import 'modules/portfolio/detail_done_job/detail_done_job_screen.dart';
import 'modules/portfolio/list_done_jobs/list_done_jobs_screen.dart';
import 'modules/proceso_seleccion/ofertas_list/list_oferta_screen.dart';
import 'modules/proceso_seleccion/proceso_detail/detail_proceso_screen.dart';
import 'modules/sign_up/sign_up_binding.dart';

void main() {
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Constants.bluelight,
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Color(0xff144FBA),
              fontSize: 30,
              fontWeight: FontWeight.bold),
          headline3: TextStyle(
              color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
          headline4: TextStyle(
              color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
              color: Constants.blackbutton,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          bodyText2: TextStyle(
            color: Constants.blackbutton,
            fontSize: 20,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUpScreen(),
      initialBinding: SignUpBinding(),
      getPages: AppPages.pages,
    );
  }
}
