import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rasan_mart/core/components/box_border.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';

Container buildCartAndQuick() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(Defaultvalue.defaultFontsize / 7),
          decoration: buildBoxDecoration(
              bgcolor: Colors.grey[300], round: true, shadow: false),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: Defaultvalue.defaultFontsize - 2,
              ),
              Text(
                'Add To Cart',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Defaultvalue.defaultFontsize / 2),
              )
            ],
          ),
        ),
        SizedBox(width: Defaultvalue.defaultFontsize / 2),
        Container(
          padding: EdgeInsets.all(Defaultvalue.defaultFontsize / 4),
          decoration:
              buildBoxDecoration(bgcolor: null, round: true, shadow: false),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.eye,
                size: Defaultvalue.defaultFontsize - 2,
              ),
              SizedBox(width: 4),
              Text(
                'QUICK VIEW',
                style: TextStyle(fontSize: Defaultvalue.defaultFontsize / 2),
              )
            ],
          ),
        )
      ],
    ),
  );
}
