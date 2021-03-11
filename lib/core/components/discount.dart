import 'package:flutter/foundation.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/core/enum/enum_convertor.dart';

String discountString(
    {@required String discountType, @required String discountAmount}) {
  EnumConvertor enumConvertor = EnumConvertor();
  DiscountType discount = enumConvertor.discountConvert(discountType);
  switch (discount) {
    case DiscountType.Flat:
      return discountAmount + ' F';
      break;
    case DiscountType.Percentage:
      return discountAmount + '%';
      break;
    default:
      return '';
      break;
  }
}
