import 'package:rasan_mart/core/enum/enum.dart';

class EnumConvertor {
  ContianerType containerConvert(int value) {
    switch (value) {
      case 0:
        return ContianerType.SearchBar;
        break;
      case 1:
        return ContianerType.HorizentalLayout;
        break;
      case 2:
        return ContianerType.GridviewLayout;
        break;
      case 3:
        return ContianerType.BannerLayout;
        break;
      case 4:
        return ContianerType.Category;
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
