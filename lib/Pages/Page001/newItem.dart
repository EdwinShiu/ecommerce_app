import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../data/product.dart';

class NewItem extends StatelessWidget {
  final List<Product> products;

  NewItem(this.products);

  @override
  Widget build(BuildContext context) {
    final Products prod = Provider.of<Products>(context);
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
          margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),   
          height: 180.0,
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
                          padding: EdgeInsets.all(5.0),
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
                bottom: 5,
                right: 5,
                child: Text(
                  "HK\$" + product.price.toString(),
                  style: GoogleFonts.ptSans(
                    fontSize: 22.0,
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
                bottom: 5,
                left: 3,
                child: Icon(
                Icons.favorite,
                  color: Colors.red,
                  size: 28,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> descriptionList(List<String> descriptionList) {
    List<Widget> textList = [
      Text(
        product.title,
        style: GoogleFonts.ptSans(
          fontSize: 24.0,
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
                  style: GoogleFonts.ptSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7F797D),
                  ),
                ),
              Flexible(
                child: Text(
                  descriptionList[index],
                  style: GoogleFonts.ptSans(
                    fontSize: 18.0,
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
