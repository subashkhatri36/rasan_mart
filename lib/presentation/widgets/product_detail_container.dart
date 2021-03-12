import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/constant/strings.dart';

class ProductDetailContainer extends StatelessWidget {
  final List<String> productDetail;

  const ProductDetailContainer({Key key, @required this.productDetail})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Defaultvalue.defaultFontsize),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          Strings.productDescription,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Defaultvalue.defaultFontsize * 1.5,
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: productDetail
              .map(
                (e) => Container(
                  padding: EdgeInsets.only(right: Defaultvalue.defaultFontsize),
                  child: Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: Defaultvalue.defaultFontsize / 5,
                                  top: Defaultvalue.defaultFontsize / 2),
                              child: Icon(
                                Icons.circle,
                                color: Colors.black,
                                size: 10,
                              ),
                            ),
                            SizedBox(width: 6),
                            Expanded(
                                child: Text(
                              e,
                              textAlign: TextAlign.left,
                            ))
                          ]),
                      SizedBox(height: Defaultvalue.defaultFontsize),
                    ],
                  ),
                ),
              )
              .toList(),
        )
      ]),
    );
  }
}
