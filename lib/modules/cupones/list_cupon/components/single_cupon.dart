import 'package:flutter/material.dart';

class SingleCupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 6, offset: Offset(1, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "45%",
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            "Nombre del servicio asociado",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "20.000.000",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, fontSize: 12),
              ),
              SizedBox(width: 5),
              Text(
                "10.000.000",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
          Text("Expire date", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
