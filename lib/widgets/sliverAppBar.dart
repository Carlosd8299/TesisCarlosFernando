import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Function onTap;

  const CustomAppBar({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      centerTitle: false,
      elevation: 0.0,
      floating: false,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 30,
        ),
        onPressed: onTap,
      ),
    );
  }
}
