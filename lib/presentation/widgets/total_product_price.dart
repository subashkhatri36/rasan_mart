import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';

class TotalProductPrice extends StatelessWidget {
  const TotalProductPrice({
    Key key,
    @required this.totalprice,
  }) : super(key: key);

  final double totalprice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Price (NRs.) ',
          style: TextStyle(
              fontSize: Defaultvalue.defaultFontsize - 4,
              fontWeight: FontWeight.bold,
              color: Colors.black45),
        ),
        SizedBox(width: Defaultvalue.defaultFontsize / 3),
        Text(
          totalprice.toString(),
          style: TextStyle(
              fontSize: Defaultvalue.defaultFontsize - 4,
              fontWeight: FontWeight.bold,
              color: Colors.black45),
        ),
      ],
    );
  }
}
