import 'dart:core';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rasan_mart/core/components/box_border.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/core/enum/enum_convertor.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/presentation/widgets/amount_box.dart';
import 'package:rasan_mart/presentation/widgets/cart_and_quickview_btn.dart';
import 'package:rasan_mart/presentation/widgets/quantity_container.dart';
import 'package:rasan_mart/presentation/widgets/sale_and_discount.dart';
import 'package:rasan_mart/presentation/widgets/total_product_price.dart';

class ProductWidget extends StatefulWidget {
  final Product product;

  const ProductWidget({Key key, this.product}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int qty = 1;
  double totalprice;

  @override
  void initState() {
    super.initState();
    totalprice =
        productTotalPrice(qty: qty, productPrice: widget.product.productPrice);
  }

  double productTotalPrice({int qty, double productPrice}) {
    setState(() {
      totalprice = productPrice * qty;
    });
  }

  @override
  Widget build(BuildContext context) {
    EnumConvertor enumConvertor = EnumConvertor();
    return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration:
            buildBoxDecoration(bgcolor: null, shadow: false, round: false),
        margin: EdgeInsets.all(Defaultvalue.defaultFontsize / 3),
        padding: EdgeInsets.all(Defaultvalue.defaultFontsize),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/productdetail', arguments: widget.product);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.only(bottom: Defaultvalue.defaultFontsize / 6),
                  child: Image.network(
                    widget.product.productImages[0],
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height * .07,
                  ),
                ),
              ),
              SizedBox(height: Defaultvalue.defaultFontsize / 2),
              Text(
                widget.product.productName,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Defaultvalue.defaultFontsize - 3),
              ),
              SizedBox(height: Defaultvalue.defaultFontsize),
              AmountBox(product: widget.product),
              QuantityContainer(qty: qty),
              TotalProductPrice(totalprice: totalprice),
              SizedBox(height: Defaultvalue.defaultFontsize),
              buildCartAndQuick(),
            ],
          ),
          if (widget.product.productOnSale)
            SalesAndDiscount(
              isSaleType: true,
              discount: 0,
              discountType: enumConvertor.discountConvert('No'),
            ),
          if (widget.product.productOnDiscount)
            SalesAndDiscount(
              isSaleType: false,
              discount: widget.product.productDiscount,
              discountType: enumConvertor
                  .discountConvert(widget.product.productDiscountType),
            ),
        ]));
  }
}
