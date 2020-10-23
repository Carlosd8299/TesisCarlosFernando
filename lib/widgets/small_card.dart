import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String title;
  final String subtitle;
  // final Function onTap;
  final Color color;

  const SmallCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: 150,
      height: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          InkWell(
              // onTap: onTap,
              child: Container(
            width: 50,
            alignment: Alignment.center,
            padding: EdgeInsets.all(5.0),
            child: Text("Ver"),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          )),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 6, offset: Offset(1, 3))
          ]),
    );
  }
}
