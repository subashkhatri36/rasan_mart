import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/presentation/widgets/counter_btn.dart';

class QuantityContainer extends StatelessWidget {
  const QuantityContainer({
    Key key,
    @required this.qty,
    @required this.isdetailpage,
  }) : super(key: key);

  final int qty;
  final bool isdetailpage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: Defaultvalue.defaultFontsize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Qty',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isdetailpage
                    ? Defaultvalue.defaultFontsize * 1.5
                    : Defaultvalue.defaultFontsize - 2),
          ),
          SizedBox(width: Defaultvalue.defaultFontsize / 2),
          Container(
            child: Row(
              children: [
                CounterBtn(
                  counterType: CounterType.Decreament,
                  isdetailpage: isdetailpage,
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: isdetailpage
                          ? Defaultvalue.defaultPadding
                          : Defaultvalue.defaultPadding / 3,
                      left: isdetailpage
                          ? Defaultvalue.defaultPadding
                          : Defaultvalue.defaultPadding / 3),
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
                        fontSize: isdetailpage
                            ? Defaultvalue.defaultFontsize * 1.5
                            : Defaultvalue.defaultFontsize - 2),
                  ),
                ),
                CounterBtn(
                  counterType: CounterType.Increament,
                  isdetailpage: isdetailpage,
                ),

                //Now Price
              ],
            ),
          )
        ],
      ),
    );
  }
}
