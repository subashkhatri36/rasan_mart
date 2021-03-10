import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/constant/strings.dart';
import 'package:rasan_mart/core/themes/app_theme.dart';
import 'package:toast/toast.dart';

AppBar buildAppBar(BuildContext context, bool isScroll) {
  return AppBar(
    actions: [
      isScroll
          ? Expanded(
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/search');
                        },
                        child: Text(
                          Strings.searchMessage,
                          style: TextStyle(
                              fontSize: Defaultvalue.defaultFontsize + 3,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'Rasan ',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.lightBtnColor,
                                fontSize: Defaultvalue.defaultFontsize * 2)),
                        new TextSpan(
                            text: 'Mart',
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900],
                                fontSize: Defaultvalue.defaultFontsize * 2)),
                      ],
                    ),
                  ),
                ],
              ),
            )
    ],
  );
}
