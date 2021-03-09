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
          ? EdgeInsets.only(left: Defaultvalue.defaultFontsize / 4)
          : EdgeInsets.only(left: Defaultvalue.defaultPadding * 5),
      height: isSaleType ? 44 : 46,
      width: 47,
      decoration: BoxDecoration(
          color: isSaleType
              ? AppTheme.lightSalesolor
              : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(Defaultvalue.defaultPadding)),
      padding: isSaleType
          ? EdgeInsets.all(Defaultvalue.defaultFontsize - 4)
          : EdgeInsets.all(Defaultvalue.defaultFontsize / 2),
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
            fontSize: Defaultvalue.defaultFontsize - 3),
      ),
    );
  }
}
