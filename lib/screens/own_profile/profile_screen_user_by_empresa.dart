import 'package:flutter/material.dart';
import 'package:itsuit/widgets/linear_gradient.dart';

import 'components/profile_image_data.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                gradient: bluegradient(),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32)),
              ),
              child: Column(
                children: <Widget>[
                  ProfileHero(
                    id: 101,
                    nombre: "carlos",
                    urlImage:
                        "https://images.pexels.com/photos/3841338/pexels-photo-3841338.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.group_add,
                              color: Colors.white,
                            ),
                            Text(
                              'Friends',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.group,
                              color: Colors.white,
                            ),
                            Text(
                              'Groups',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.videocam,
                              color: Colors.white,
                            ),
                            Text(
                              'Videos',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            Text(
                              'Likes',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              padding: EdgeInsets.all(42),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.table_chart,
                            color: Colors.grey,
                          ),
                          Text(
                            'Leaders',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.show_chart,
                            color: Colors.grey,
                          ),
                          Text(
                            'Level up',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.card_giftcard,
                            color: Colors.grey,
                          ),
                          Text(
                            'Leaders',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.code,
                            color: Colors.grey,
                          ),
                          Text('QR code')
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.blur_circular,
                            color: Colors.grey,
                          ),
                          Text('Daily bonus')
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                          Text('Visitors')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
