import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';

class ProductDetails extends StatelessWidget {
  final Product productDetails;

  const ProductDetails({Key key, @required this.productDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            child: Column(
          children: [
            ProductImageDetails(
              product: productDetails,
            )
          ],
        )),
      ),
    );
  }
}

class ProductImageDetails extends StatelessWidget {
  final Product product;
  const ProductImageDetails({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Defaultvalue.defaultFontsize),
        padding: EdgeInsets.all(Defaultvalue.defaultFontsize),
        child: Column(children: [
          Text(
            product.productName,
            style: TextStyle(
                fontSize: Defaultvalue.defaultFontsize + 5,
                fontWeight: FontWeight.bold),
          )
        ]));
  }
}
