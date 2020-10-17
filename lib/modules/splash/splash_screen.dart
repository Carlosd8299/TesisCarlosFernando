import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
