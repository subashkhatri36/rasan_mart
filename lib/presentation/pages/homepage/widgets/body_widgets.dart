import 'package:flutter/material.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/data/models/product_container/product_container.dart';
import 'package:rasan_mart/presentation/widgets/horizental_product_container.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key key,
    @required this.productContainer,
  }) : super(key: key);

  //final ScrollController _scrollViewController;
  final List<ProductContainer> productContainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: productContainer.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Color color = productContainer[index].backgroundColor;
                  String title = productContainer[index].containerTitle;
                  List<Product> plist = productContainer[index].productList;
                  return HorizentalProductContainer(
                    containerTitle: title,
                    backgroundColor: color,
                    productList: plist,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
