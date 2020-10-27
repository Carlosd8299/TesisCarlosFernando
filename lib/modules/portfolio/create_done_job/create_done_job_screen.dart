import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:itsuit/widgets/switcher.dart';

import 'create_done_job_controller.dart';

class CreateDoneJobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateDoneJobController>(
      builder: (_) =>
          Switcher(CreateDoneJobProveedor(), CreateDoneJobProveedor(), 1),
    );
  }
}

class CreateDoneJobProveedor extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scafolKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateDoneJobController>(
        builder: (controller) => Scaffold());
  }
}
