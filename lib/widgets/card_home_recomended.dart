import 'package:flutter/material.dart';
import 'package:itsuit/utils/constants.dart';

final List<String> categorias = [
  "Redes",
  "Sistemas",
  "Si",
  "Audit",
  "Redes",
  "Sistemas",
  "Si",
  "Audit"
];

class CardRecomended extends StatelessWidget {
  final bool isProveedor;

  const CardRecomended({Key key, @required this.isProveedor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nombre de la compañia"),
                Container(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    "https://es.logodownload.org/wp-content/uploads/2018/10/coca-cola-logo-11-1024x335.png",
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Nombre de la solicitud de servicios",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          isProveedor
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.greencake,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 6,
                              offset: Offset(1, 3))
                        ]),
                    child: Text("Categoria"),
                  ),
                )
              : Container(
                  height: 50,
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categorias.length,
                    itemBuilder: (context, index) {
                      String categoria = categorias[index];
                      Color color = Constants.colorlist[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: color,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 6,
                                    offset: Offset(1, 3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categoria,
                              style: TextStyle(color: Constants.blacktitles),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Text("Fecha de publicacion"),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constants.withe,
          boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 6, offset: Offset(1, 3))
          ]),
    );
  }
}
