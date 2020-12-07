import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;
  final Function function;
  final bool estado;

  const RoundedIconButton({
    Key key,
    @required this.label,
    @required this.color,
    @required this.icon,
    @required this.function,
    this.estado,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Visibility(
        visible: estado,
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 1),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Icon(
                  icon,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
