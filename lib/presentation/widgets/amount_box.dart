import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';

class AmountBox extends StatelessWidget {
  const AmountBox({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('NRs. ' + product.productPrice.toString(),
            style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontSize: Defaultvalue.defaultFontsize - 4,
                fontWeight: FontWeight.bold)),
        SizedBox(width: Defaultvalue.defaultFontsize - 5),
        Text('NRs. ' + product.productCuttedPrice.toString(),
            style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Theme.of(context).accentColor,
                fontSize: Defaultvalue.defaultFontsize - 4,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
