import 'package:flutter/material.dart';
import 'package:rasan_mart/core/components/box_border.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/constant/strings.dart';

class SearchBarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/search');
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Defaultvalue.defaultPadding,
            vertical: Defaultvalue.defaultPadding / 2),
        padding: EdgeInsets.all(Defaultvalue.defaultPadding / 2),
        decoration: buildBoxDecoration(
            bgcolor: Theme.of(context).primaryColor, shadow: true, round: true),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.search,
              color: Theme.of(context).accentColor,
            ),
            SizedBox(width: 10),
            Text(
              Strings.searchMessage,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
