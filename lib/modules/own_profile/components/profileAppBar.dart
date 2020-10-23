import 'package:flutter/material.dart';

class AppBarProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(70)),
          child:
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {})),
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 20,
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
  }
}
