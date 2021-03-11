import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/data/models/Scroll_banner/scroll_banner_model.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/data/models/product/product_container.dart';
import 'package:rasan_mart/presentation/widgets/Gridview_product_container.dart';
import 'package:rasan_mart/presentation/widgets/Scroll_banner.dart';
import 'package:rasan_mart/presentation/widgets/Gridview_categories.dart';
import 'package:rasan_mart/presentation/widgets/horizental_product_container.dart';
import 'package:rasan_mart/presentation/widgets/search_bar_icons.dart';

class HomeBody extends StatefulWidget {
  HomeBody({
    Key key,
    @required this.productContainer,
  }) : super(key: key);

  //final ScrollController _scrollViewController;
  final List<ProductContainer> productContainer;

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: NotificationListener<ScrollNotification>(
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: widget.productContainer.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    //checking file is banner or not first

                    switch (widget.productContainer[index].contianerType) {
                      case ContianerType.SearchBar:
                        return SearchBarIcon();
                        break;

                      case ContianerType.HorizentalLayout:
                        Color color =
                            widget.productContainer[index].backgroundColor;
                        String title =
                            widget.productContainer[index].containerTitle;
                        List<String> plist =
                            widget.productContainer[index].productIdList;
                        return HorizentalProductContainer(
                          containerTitle: title,
                          backgroundColor: color,
                          productIdList: plist,
                        );
                      case ContianerType.GridviewLayout:
                        Color color =
                            widget.productContainer[index].backgroundColor;
                        String title =
                            widget.productContainer[index].containerTitle;
                        List<String> plist =
                            widget.productContainer[index].productIdList;
                        return GridViewProduct(
                          containerTitle: title,
                          backgroundColor: color,
                          productIdList: plist,
                        );

                      case ContianerType.BannerLayout:
                        return BannerScrollImage();
                        break;
                      case ContianerType.Category:
                        return CategoriesGridView();
                        break;
                      default:
                        return null;
                        break;
                    }
                  }),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
