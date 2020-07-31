import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 25.0),
          height: 250.0,
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'New',
            style: GoogleFonts.roboto(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0090F8),
            ),
          ),
        ),
        Expanded(
          child: ListView(
          ),
        ),
      ],
    );
  }
}
