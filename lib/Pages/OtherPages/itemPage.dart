import 'package:flutter/material.dart';
class ItemPage extends StatefulWidget {
  static const routeName = '/itemPage';
  
  @override
  ItemPageState createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {

  PageController _mainNavigationPageController;
  
  @override
  void initState() {
    super.initState();
    _mainNavigationPageController = PageController();
  }

  @override
  void dispose() {
    _mainNavigationPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: RaisedButton(onPressed: () {
          Navigator.of(context).pop();
        }),
      ),
    );
  }
}