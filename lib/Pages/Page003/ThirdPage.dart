import 'package:ecommerce_app/data/user.dart';
import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../data/items.dart';

class ThirdPage extends StatefulWidget {
  @override
  ThirdPageState createState() => ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  

  @override
  Widget build(BuildContext context) {
    print('ThirdPage rebuild');
    //var uid = Provider.of<User>(context);
    //print(uid?.uid);
    var userData = Provider.of<UserData>(context);
    //print("userData " + userData.toString());
    int favoriteItemNumber = favoriteNumber;
    if (userData != null) {
      favoriteItemNumber = userData.favorite.length;
    }
    final double defaultSize = SizeConfig.defaultSize;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: defaultSize * 0.7, horizontal: defaultSize * 0.9),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Favorite',
            style: TextStyle(
              fontSize: defaultSize * 4.3,
              fontWeight: FontWeight.w500,
              color: sonyBlack,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: favoriteItemNumber,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(defaultSize * 0.9),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Color.fromRGBO(230, 230, 230, 1),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            color: itemBackgroundColor,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              highlightColor: Color.fromRGBO(170, 170, 195, 0.3),
                              onTap: () {
                                // TODO: Hero to itemPage
                              },
                            )
                          ),     
                          Positioned(
                            bottom: defaultSize * 0.3,
                            left: defaultSize * 0.3,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                highlightColor: Color.fromRGBO(170, 170, 195, 0.3),                               
                                child: Icon(
                                  Icons.favorite,
                                  size: defaultSize * 2.8,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    // TODO: Data management
                                    if (favoriteNumber > 0) {
                                      favoriteNumber--;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                highlightColor: Color.fromRGBO(170, 170, 195, 0.3),                               
                                onTap: () {
                                  // TODO: Hero to ItemPage
                                },
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(7, 3, 7, 10),
                                      child: Text(
                                        'Testing Testing Testing Testing Testing',
                                        style: TextStyle(
                                          fontSize: defaultSize * 2.2,
                                          fontWeight: FontWeight.w500,
                                          color: sonyBlack,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                                          child: Text(
                                            'HK\$ XX,XXX',
                                            style: TextStyle(
                                              fontSize: defaultSize * 2.1,
                                              fontWeight: FontWeight.w500,
                                              color: sonyBlack,
                                            ),
                                          ),
                                        ),
                                      ),                                   
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}