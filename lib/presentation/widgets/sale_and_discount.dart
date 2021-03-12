import 'package:flutter/material.dart';
import 'package:rasan_mart/core/components/discount.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/themes/app_theme.dart';

class SalesAndDiscount extends StatefulWidget {
  final bool isSaleType;
  final double discount;
  final String discountType;
  final bool isgridview;

  const SalesAndDiscount({
    Key key,
    @required this.isSaleType,
    @required this.discount,
    @required this.discountType,
    @required this.isgridview,
  }) : super(key: key);

  @override
  _SalesAndDiscountState createState() => _SalesAndDiscountState();
}

class _SalesAndDiscountState extends State<SalesAndDiscount>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed)
          _controller.reverse();
        else if (status == AnimationStatus.dismissed) _controller.forward();
      });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Container(
            margin: widget.isSaleType
                ? EdgeInsets.zero
                : widget.isgridview
                    ? EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .28)
                    : EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .23),
            height: widget.isSaleType ? 35 : 35,
            width: 35,
            decoration: BoxDecoration(
                color: ColorTween(
                  begin: widget.isSaleType
                      ? AppTheme.lightSalesolor
                      : Theme.of(context).backgroundColor,
                  end: widget.isSaleType
                      ? Colors.greenAccent[100]
                      : Theme.of(context).backgroundColor,
                ).animate(_controller).value,
                borderRadius:
                    BorderRadius.circular(Defaultvalue.defaultPadding)),
            padding: widget.isSaleType
                ? EdgeInsets.all(Defaultvalue.defaultFontsize - 6)
                : EdgeInsets.all(Defaultvalue.defaultFontsize / 3),
            alignment: Alignment.center,
            child: Text(
              widget.isSaleType
                  ? 'Sale'
                  : discountString(
                      discountType: widget.discountType,
                      discountAmount: widget.discount.toString()),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Defaultvalue.defaultFontsize - 5),
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
