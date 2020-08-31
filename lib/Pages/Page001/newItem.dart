import 'package:ecommerce_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../data/product.dart';

class NewItem extends StatelessWidget {
  final List<Product> products;

  NewItem(this.products);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    //print("products " + prod.toString());
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        product = products[index];
        return Container(
          decoration: BoxDecoration(        
            border: Border.all(
              width: 1.0,
              color: Color.fromRGBO(230, 230, 230, 1),
            ),
          ),
          margin: EdgeInsets.symmetric(vertical: defaultSize * 0.5, horizontal: defaultSize),   
          height: defaultSize * 15.6,
          child: Stack(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: itemBackgroundColor,
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: <Widget> [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(defaultSize * 0.4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: descriptionList(product.description),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: defaultSize * 0.4,
                right: defaultSize * 0.4,
                child: Text(
                  "HK\$ " + product.price.toString(),
                  style: TextStyle(
                    fontSize: defaultSize * 2,
                    fontWeight: FontWeight.w500,
                    color: sonyBlack,
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: Color.fromRGBO(170, 170, 195, 0.3),
                  onTap: () => print("Work In Progress"),              
                ),
              ),
              Positioned(
                bottom: defaultSize * 0.4,
                left: defaultSize * 0.3,
                child: Icon(
                Icons.favorite,
                  color: Colors.red,
                  size: defaultSize * 2.4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> descriptionList(List<String> descriptionList) {
    double defaultSize = SizeConfig.defaultSize;
    List<Widget> textList = [
      Text(
        product.title,
        style: TextStyle(
          fontSize: defaultSize * 2.1,
          fontWeight: FontWeight.w500,
          color: sonyBlack,
        ),
      ),
    ];
    if (descriptionList.length > 0) {
      for(int index = 0; index < descriptionList.length; index++) {
        textList.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  " • ",
                  style: TextStyle(
                    fontSize: defaultSize * 1.6,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                ),
              Flexible(
                child: Text(
                  descriptionList[index],
                  style: TextStyle(
                    fontSize: defaultSize * 1.6,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                )
              )
            ]
          ),
        );
      }
    }
    return textList;
  }
}
