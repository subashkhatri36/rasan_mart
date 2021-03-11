import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rasan_mart/core/components/box_border.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/presentation/widgets/amount_box.dart';
import 'package:rasan_mart/presentation/widgets/cart_and_quickview_btn.dart';
import 'package:rasan_mart/presentation/widgets/quantity_container.dart';
import 'package:rasan_mart/presentation/widgets/sale_and_discount.dart';
import 'package:rasan_mart/presentation/widgets/total_product_price.dart';

class ProductWidget extends StatefulWidget {
  final ContianerType contianerType;
  final Product product;

  const ProductWidget(
      {Key key, @required this.product, @required this.contianerType})
      : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int qty = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.41,
        decoration: buildBoxDecoration(
            bgcolor: widget.product.backgroundColor.isEmpty
                ? Colors.transparent
                : HexColor(widget.product.backgroundColor),
            shadow: false,
            round: false),
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
                  child: Hero(
                    tag: widget.product.productId,
                    child: Image.network(
                      widget.product.productImages[0],
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Defaultvalue.defaultFontsize / 2),
              Text(
                widget.product.productName,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Defaultvalue.defaultFontsize - 3),
              ),
              SizedBox(height: Defaultvalue.defaultFontsize),
              AmountBox(
                product: widget.product,
                isdetailpage: false,
              ),
              QuantityContainer(
                qty: qty,
                isdetailpage: false,
              ),
              TotalProductPrice(
                totalprice: widget.product.productPrice,
                qty: 1,
                isdetailpage: false,
              ),
              SizedBox(height: Defaultvalue.defaultFontsize),
              buildCartAndQuick(false, context),
            ],
          ),
          if (widget.product.productOnSale)
            SalesAndDiscount(
              isSaleType: true,
              discount: 0,
              discountType: 'No',
              isgridview: returnvalue(widget.contianerType),
            ),
          if (widget.product.productOnDiscount)
            SalesAndDiscount(
              isSaleType: false,
              discount: widget.product.productDiscount,
              discountType: widget.product.productDiscountType,
              isgridview: returnvalue(widget.contianerType),
            ),
        ]));
  }
}

bool returnvalue(ContianerType contianerType) {
  return contianerType == ContianerType.HorizentalLayout ? false : true;
}
