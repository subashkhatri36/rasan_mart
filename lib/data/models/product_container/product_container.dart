import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/core/enum/enum_convertor.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';

class ProductContainer {
  final Color backgroundColor;
  final String containerTitle;
  final List<Product> productList;
  final int layoutType;
  ContianerType contianerType;
  final int layoutindex;

  EnumConvertor enumConvertor = EnumConvertor();

  ProductContainer({
    @required this.layoutindex,
    @required this.layoutType,
    @required this.backgroundColor,
    @required this.containerTitle,
    @required this.productList,
  }) {
    this.contianerType = enumConvertor.containerConvert(layoutType);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProductContainer &&
        o.backgroundColor == backgroundColor &&
        o.containerTitle == containerTitle &&
        listEquals(o.productList, productList) &&
        o.layoutType == layoutType &&
        o.contianerType == contianerType &&
        o.layoutindex == layoutindex;
  }

  @override
  int get hashCode {
    return backgroundColor.hashCode ^
        containerTitle.hashCode ^
        productList.hashCode ^
        layoutType.hashCode ^
        contianerType.hashCode ^
        layoutindex.hashCode;
  }
}
