import 'package:flutter/material.dart';

class SingleOferta extends StatelessWidget {
  final String nombreProveedor;
  final String srcImageProveedor;
  final String fechaSubidaOferta;

  const SingleOferta(
      {Key key,
      @required this.nombreProveedor,
      @required this.srcImageProveedor,
      @required this.fechaSubidaOferta})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Image.network(
            srcImageProveedor,
            width: 150,
            height: 50,
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            children: [
              Text(
                nombreProveedor,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                fechaSubidaOferta,
              ),
            ],
          )
        ],
      ),
    );
  }
}
