import 'package:flutter/material.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/data/models/product/product_container.dart';
import 'package:rasan_mart/presentation/widgets/Gridview_categories.dart';
import 'package:rasan_mart/presentation/widgets/Gridview_product_container.dart';
import 'package:rasan_mart/presentation/widgets/Scroll_banner.dart';
import 'package:rasan_mart/presentation/widgets/horizental_product_container.dart';
import 'package:rasan_mart/presentation/widgets/search_bar_icons.dart';

Widget homebody(
    {List<ProductContainer> productContainer,
    int index,
    BuildContext context}) {
  switch (productContainer[index].contianerType) {
    case ContianerType.SearchBar:
      return SearchBarIcon();
      break;

    case ContianerType.HorizentalLayout:
      Color color = productContainer[index].backgroundColor;
      String title = productContainer[index].containerTitle;
      List<String> plist = productContainer[index].productIdList;
      return HorizentalProductContainer(
        containerTitle: title,
        backgroundColor: color,
        productIdList: plist,
      );
    case ContianerType.GridviewLayout:
      Color color = productContainer[index].backgroundColor;
      String title = productContainer[index].containerTitle;
      List<String> plist = productContainer[index].productIdList;
      return GridViewProduct(
        containerTitle: title,
        backgroundColor: color,
        productIdList: plist,
      );

    case ContianerType.BannerLayout:
      return BannerScrollImage();
      break;
    case ContianerType.Category:
      return CategoriesGridView(
        istabclick: false,
      );
      break;
    default:
      return null;
      break;
  }
}
