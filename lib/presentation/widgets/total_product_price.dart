import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';

class TotalProductPrice extends StatelessWidget {
  const TotalProductPrice(
      {Key key,
      @required this.totalprice,
      @required this.isdetailpage,
      @required this.qty})
      : super(key: key);

  final double totalprice;
  final int qty;
  final bool isdetailpage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Price (NRs.) ',
          style: TextStyle(
              fontSize: isdetailpage
                  ? Defaultvalue.defaultFontsize * 1.5
                  : Defaultvalue.defaultFontsize - 4,
              fontWeight: FontWeight.bold,
              color: Colors.black45),
        ),
        SizedBox(width: Defaultvalue.defaultFontsize / 3),
        Text(
          calculateTotal(qty, totalprice),
          style: TextStyle(
              fontSize: isdetailpage
                  ? Defaultvalue.defaultFontsize * 1.5
                  : Defaultvalue.defaultFontsize - 4,
              fontWeight: FontWeight.bold,
              color: Colors.black45),
        ),
      ],
    );
  }
}

String calculateTotal(int qty, double total) {
  double result = qty * total;
  return result.toString();
}
