import 'package:flutter/material.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/core/enum/enum_convertor.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';

class BuyTotalContainer extends StatefulWidget {
  final List<Product> cartProduct;

  const BuyTotalContainer({
    Key key,
    @required this.cartProduct,
  }) : super(key: key);
  @override
  _BuyTotalContainerState createState() => _BuyTotalContainerState();
}

class _BuyTotalContainerState extends State<BuyTotalContainer> {
  EnumConvertor enumConvertor = new EnumConvertor();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //total items
        Row(children: [
          Text('Total Item(S)'),
          Text(widget.cartProduct.length.toString())
        ]),
        //total Amount
        Row(children: [
          Text('Total Amount'),
          Text(totalDiscountCalculate().toString())
        ]),
        //discount Amount
        Row(children: [
          Text('Total discount'),
          Text(totalAmountCalculate().toString())
        ]),
        //Grand total Amount
        Row(children: [
          Text('Grand Total Amount'),
          Text(totalCalculateTotalsum().toString())
        ]),
        //BuyNow
        Container()
      ],
    );
  }

  double totalDiscountCalculate() {
    double totaldiscount = 0;

    for (int i = 0; i < widget.cartProduct.length; i++) {
      DiscountType discountType = enumConvertor.discountConvert(
        widget.cartProduct[i].productDiscountType,
      );
      switch (discountType) {
        case DiscountType.Flat:
          totaldiscount += (widget.cartProduct[i].productPrice -
              widget.cartProduct[i].productDiscount);
          break;
        case DiscountType.Percentage:
          totaldiscount += (widget.cartProduct[i].productPrice *
              widget.cartProduct[i].productDiscount);
          break;
        default:
          break;
      }
    }
    return totaldiscount;
    // switch(widget.cartProduct)
  }

  double totalAmountCalculate() {
    double totalamount;
    widget.cartProduct.map((e) => totalamount += (e.productPrice * e.qetQty));
    return totalamount;
  }

  double totalCalculateTotalsum() {
    double totalsum;
    totalsum = totalAmountCalculate() - totalDiscountCalculate();
    return totalsum;
  }
}
