import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/presentation/widgets/total_product_price.dart';

class QuantityAndTotalpriceContainer extends StatefulWidget {
  const QuantityAndTotalpriceContainer({
    Key key,
    @required this.product,
    @required this.isdetailpage,
  }) : super(key: key);

  final Product product;
  final bool isdetailpage;

  @override
  _QuantityContainerState createState() => _QuantityContainerState();
}

class _QuantityContainerState extends State<QuantityAndTotalpriceContainer> {
  Product _product;
  int qty;
  double _totalprice;
  @override
  void initState() {
    _product = widget.product;
    qty = 1;
    _totalprice = _product.productPrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: Defaultvalue.defaultFontsize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Qty',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: widget.isdetailpage
                        ? Defaultvalue.defaultFontsize * 1.5
                        : Defaultvalue.defaultFontsize - 2),
              ),
              SizedBox(width: Defaultvalue.defaultFontsize / 2),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        countermethod(CounterType.Decreament);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black38,
                            style: BorderStyle.solid,
                          ),
                          color: widget.isdetailpage
                              ? Theme.of(context).backgroundColor
                              : Theme.of(context).accentColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                        ),
                        height: widget.isdetailpage
                            ? Defaultvalue.defaultFontsize * 2
                            : Defaultvalue.defaultFontsize + 2,
                        width: widget.isdetailpage
                            ? Defaultvalue.defaultFontsize * 3
                            : Defaultvalue.defaultFontsize * 1.5,
                        child: Icon(
                          Icons.remove,
                          color: widget.isdetailpage
                              ? Theme.of(context).primaryColor
                              : Colors.black54,
                          size: widget.isdetailpage
                              ? Defaultvalue.defaultFontsize + 5
                              : Defaultvalue.defaultFontsize,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: widget.isdetailpage
                              ? Defaultvalue.defaultPadding / 2
                              : Defaultvalue.defaultPadding / 3,
                          left: widget.isdetailpage
                              ? Defaultvalue.defaultPadding / 2
                              : Defaultvalue.defaultPadding / 3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Text(
                        qty.toString(),
                        style: TextStyle(
                            fontSize: widget.isdetailpage
                                ? Defaultvalue.defaultFontsize * 1.5
                                : Defaultvalue.defaultFontsize - 2),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        countermethod(CounterType.Increament);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black38,
                              style: BorderStyle.solid,
                            ),
                            color: widget.isdetailpage
                                ? Theme.of(context).backgroundColor
                                : Theme.of(context).accentColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomRight: Radius.circular(40))),
                        height: widget.isdetailpage
                            ? Defaultvalue.defaultFontsize * 2
                            : Defaultvalue.defaultFontsize + 2,
                        width: widget.isdetailpage
                            ? Defaultvalue.defaultFontsize * 3
                            : Defaultvalue.defaultFontsize * 1.5,
                        child: Icon(
                          Icons.add,
                          color: widget.isdetailpage
                              ? Theme.of(context).primaryColor
                              : Colors.black54,
                          size: widget.isdetailpage
                              ? Defaultvalue.defaultFontsize + 5
                              : Defaultvalue.defaultFontsize,
                        ),
                      ),
                    ),

                    //Now Price
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: Defaultvalue.defaultFontsize),
          TotalProductPrice(
            totalprice: _totalprice,
            isdetailpage: widget.isdetailpage,
          ),
        ],
      ),
    );
  }

  bool counterIncrement(CounterType counterType) {
    switch (counterType) {
      case CounterType.Increament:
        return true;
        break;
      default:
        return false;
        break;
    }
  }

  void countermethod(CounterType counterType) {
    switch (counterType) {
      case CounterType.Increament:
        setState(() {
          qty++;
          _totalprice = _product.productPrice * qty;
        });
        break;
      case CounterType.Decreament:
        setState(() {
          if (qty > 1) {
            qty--;
            _totalprice = _product.productPrice * qty;
          } else {
            qty = 1;
            _totalprice = _product.productPrice * qty;
          }
        });
        break;
      default:
        setState(() {
          qty = 1;
          _totalprice = _product.productPrice * qty;
        });
        break;
    }
  }
}
