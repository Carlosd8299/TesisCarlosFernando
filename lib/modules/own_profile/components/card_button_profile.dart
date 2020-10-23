import 'package:flutter/material.dart';

class CardButtonProfile extends StatelessWidget {
  final Color color;
  final String label;
  final Function onTap;
  final IconData icon;

  const CardButtonProfile({
    Key key,
    @required this.color,
    @required this.label,
    @required this.onTap,
    @required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 6,
                offset: Offset(1, 3),
              )
            ]),
        height: 155,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(label, style: Theme.of(context).textTheme.bodyText1)
          ],
        ),
      ),
    );
  }
}
