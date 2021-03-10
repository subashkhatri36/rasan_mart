import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/core/themes/app_theme.dart';

class SalesAndDiscount extends StatelessWidget {
  final bool isSaleType;
  final double discount;
  final DiscountType discountType;

  const SalesAndDiscount({
    Key key,
    @required this.isSaleType,
    @required this.discount,
    @required this.discountType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isSaleType
          ? EdgeInsets.zero
          : EdgeInsets.only(left: MediaQuery.of(context).size.width * .2),
      height: isSaleType ? 35 : 35,
      width: 35,
      decoration: BoxDecoration(
          color: isSaleType
              ? AppTheme.lightSalesolor
              : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(Defaultvalue.defaultPadding)),
      padding: isSaleType
          ? EdgeInsets.all(Defaultvalue.defaultFontsize - 6)
          : EdgeInsets.all(Defaultvalue.defaultFontsize / 3),
      alignment: Alignment.center,
      child: Text(
        isSaleType
            ? 'Sale'
            : discountType == DiscountType.Flat
                ? discount.toString() + ' F'
                : discount.toString() + '%',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: Defaultvalue.defaultFontsize - 5),
      ),
    );
  }
}
