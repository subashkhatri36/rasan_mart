import 'package:flutter/foundation.dart';

class Product {
  final String productName;
  final List<String> productImages;
  final double productPrice;
  final double productCuttedPrice;
  final bool productOnSale;
  final double productDiscount;
  final String productDiscountType;
  final bool productOnDiscount;

  Product({
    @required this.productOnDiscount,
    @required this.productImages,
    @required this.productPrice,
    @required this.productCuttedPrice,
    @required this.productOnSale,
    @required this.productDiscount,
    @required this.productDiscountType,
    @required this.productName,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product &&
        o.productName == productName &&
        listEquals(o.productImages, productImages) &&
        o.productPrice == productPrice &&
        o.productCuttedPrice == productCuttedPrice &&
        o.productOnSale == productOnSale &&
        o.productDiscount == productDiscount &&
        o.productDiscountType == productDiscountType &&
        o.productOnDiscount == productOnDiscount;
  }

  @override
  int get hashCode {
    return productName.hashCode ^
        productImages.hashCode ^
        productPrice.hashCode ^
        productCuttedPrice.hashCode ^
        productOnSale.hashCode ^
        productDiscount.hashCode ^
        productDiscountType.hashCode ^
        productOnDiscount.hashCode;
  }
}
