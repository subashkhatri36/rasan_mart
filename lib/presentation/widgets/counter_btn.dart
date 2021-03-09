import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/enum/enum.dart';

class CounterBtn extends StatelessWidget {
  final CounterType counterType;
  const CounterBtn({
    Key key,
    @required this.counterType,
  }) : super(key: key);
  bool counterIncrement() {
    switch (this.counterType) {
      case CounterType.Increament:
        return true;
        break;
      default:
        return false;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => countermethod,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black38,
            style: BorderStyle.solid,
          ),
          color: Theme.of(context).accentColor,
          borderRadius: counterIncrement()
              ? BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40))
              : BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
        ),
        height: Defaultvalue.defaultFontsize + 5,
        width: Defaultvalue.defaultFontsize * 2,
        child: Icon(
          counterIncrement() ? Icons.add : Icons.remove,
          color: Colors.black54,
          size: Defaultvalue.defaultFontsize,
        ),
      ),
    );
  }

  void countermethod() {}
}
