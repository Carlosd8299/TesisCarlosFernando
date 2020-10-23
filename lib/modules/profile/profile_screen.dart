import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsuit/modules/profile/profile_controller.dart';
import 'package:itsuit/widgets/switcher.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) =>
          Switcher(ProfileProveedor(), ProfileEmpresa(), 1),
    );
  }
}

class ProfileProveedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(),
    );
  }
}

class ProfileEmpresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Scaffold(),
    );
  }
}
