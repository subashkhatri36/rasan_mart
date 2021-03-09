import 'dart:core';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/core/enum/enum_convertor.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/presentation/widgets/amount_box.dart';
import 'package:rasan_mart/presentation/widgets/counter_btn.dart';
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
        width: MediaQuery.of(context).size.width * 0.65,
        decoration: buildBoxDecoration(null, false),
        margin: EdgeInsets.all(Defaultvalue.defaultFontsize / 2),
        padding: EdgeInsets.all(Defaultvalue.defaultFontsize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  EdgeInsets.only(bottom: Defaultvalue.defaultFontsize / 5),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: Defaultvalue.defaultFontsize),
                    height: 100,
                    width: 130,
                    child: Image.network(
                      widget.product.productImages[0],
                    ),
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
                ],
              ),
            ),
            SizedBox(height: Defaultvalue.defaultFontsize / 2),
            Text(
              widget.product.productName,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: Defaultvalue.defaultFontsize),
            AmountBox(product: widget.product),
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: Defaultvalue.defaultFontsize),
              child: Row(
                children: [
                  Text(
                    'Qty',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Defaultvalue.defaultFontsize),
                  ),
                  SizedBox(width: Defaultvalue.defaultFontsize / 2),
                  Container(
                    child: Row(
                      children: [
                        CounterBtn(
                          counterType: CounterType.Decreament,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: Defaultvalue.defaultPadding / 2,
                              left: Defaultvalue.defaultPadding / 2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black38,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Text(
                            '$qty',
                            style: TextStyle(
                                fontSize: Defaultvalue.defaultFontsize),
                          ),
                        ),
                        CounterBtn(
                          counterType: CounterType.Increament,
                        ),

                        //Now Price
                      ],
                    ),
                  )
                ],
              ),
            ),
            TotalProductPrice(totalprice: totalprice),
            SizedBox(height: Defaultvalue.defaultFontsize),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(Defaultvalue.defaultFontsize / 2),
                    decoration: buildBoxDecoration(Colors.grey[300], true),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: Defaultvalue.defaultFontsize,
                        ),
                        Text(
                          'Add To Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Defaultvalue.defaultFontsize - 4),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: Defaultvalue.defaultFontsize),
                  Container(
                    padding: EdgeInsets.all(Defaultvalue.defaultFontsize / 2),
                    decoration: buildBoxDecoration(null, true),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.eye,
                          size: Defaultvalue.defaultFontsize,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'QUICK VIEW',
                          style: TextStyle(
                              fontSize: Defaultvalue.defaultFontsize - 4),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  BoxDecoration buildBoxDecoration(Color bgcolor, bool round) {
    return BoxDecoration(
      color: bgcolor != null ? bgcolor : Colors.transparent,
      borderRadius: round
          ? BorderRadius.circular(Defaultvalue.defaultFontsize / 2)
          : BorderRadius.circular(0),
      border: Border.all(
        width: 1,
        color: Colors.black38,
        style: BorderStyle.solid,
      ),
    );
  }
}
