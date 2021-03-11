import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rasan_mart/core/components/box_border.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';

Container buildCartAndQuick(bool isdetailpage, BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: isdetailpage
              ? EdgeInsets.symmetric(
                  horizontal: Defaultvalue.defaultPadding * 2,
                  vertical: Defaultvalue.defaultFontsize / 2,
                )
              : EdgeInsets.all(Defaultvalue.defaultFontsize / 4),
          decoration: buildBoxDecoration(
              bgcolor: isdetailpage
                  ? Theme.of(context).backgroundColor
                  : Colors.grey[300],
              round: true,
              shadow: false),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: isdetailpage
                    ? Defaultvalue.defaultPadding
                    : Defaultvalue.defaultFontsize - 2,
                color: isdetailpage
                    ? Theme.of(context).primaryColor
                    : Colors.black54,
              ),
              Text(
                'Add To Cart',
                style: TextStyle(
                    color: isdetailpage
                        ? Theme.of(context).primaryColor
                        : Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: isdetailpage
                        ? Defaultvalue.defaultPadding
                        : Defaultvalue.defaultFontsize / 2),
              )
            ],
          ),
        ),
        if (!isdetailpage) SizedBox(width: Defaultvalue.defaultFontsize / 2),
        if (!isdetailpage)
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
          ),
      ],
    ),
  );
}
