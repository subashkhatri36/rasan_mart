import 'package:rasan_mart/core/enum/enum.dart';

class EnumConvertor {
  ContianerType containerConvert(int value) {
    switch (value) {
      case 1:
        return ContianerType.HorizentalLayout;
        break;
      case 2:
        return ContianerType.GridviewLayout;
        break;
      default:
        return ContianerType.GridviewLayout;
        break;
    }
  }

  DiscountType discountConvert(String value) {
    switch (value) {
      case 'Flat':
        return DiscountType.Flat;
        break;
      case 'Discount':
        return DiscountType.Percentage;
        break;
      default:
        return DiscountType.Percentage;
        break;
    }
  }
}
