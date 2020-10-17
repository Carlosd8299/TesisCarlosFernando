import 'package:flutter/material.dart';

class ProfileHero extends StatelessWidget {
  final String nombre, urlImage;
  final int id;

  const ProfileHero({
    Key key,
    @required this.nombre,
    @required this.urlImage,
    @required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fitWidth, image: NetworkImage(urlImage)),
              )),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          id.toString(),
          style: TextStyle(color: Colors.white70),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 32),
        child: Text(
          nombre,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
