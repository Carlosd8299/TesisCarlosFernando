import 'package:flutter/material.dart';

class ButtomBottomNav extends StatelessWidget {
  final String titleButton;
  final String instruction;
  final Function onTap;
  final Icon icon;
  final Color color;

  const ButtomBottomNav({
    Key key,
    @required this.titleButton,
    @required this.instruction,
    @required this.onTap,
    @required this.icon,
    @required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.maxFinite,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleButton,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: icon,
                  onPressed: onTap,
                  iconSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            instruction,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
