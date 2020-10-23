import 'package:flutter/material.dart';
import 'package:itsuit/utils/constants.dart';

class SearchBar extends StatelessWidget {
  @required
  final String hint;
  @required
  final double width;

  const SearchBar({Key key, this.hint, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 600,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Constants.bluelight,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 6, offset: Offset(1, 3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ));
  }
}
