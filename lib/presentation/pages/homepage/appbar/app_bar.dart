import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/constant/strings.dart';
import 'package:toast/toast.dart';

AppBar buildAppBar(BuildContext context, bool isScroll) {
  return AppBar(
    title: Text(Strings.appName),
    actions: [
      if (isScroll)
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Toast.show('you click Search', context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  Text(
                    Strings.searchMessage,
                    style: TextStyle(
                        fontSize: Defaultvalue.defaultFontsize + 3,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        )
    ],
  );
}
