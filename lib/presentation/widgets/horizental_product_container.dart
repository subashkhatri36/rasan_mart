import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/constant/strings.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/presentation/widgets/product_widget.dart';

class HorizentalProductContainer extends StatelessWidget {
  final String containerTitle;
  final List<Product> productList;
  final Color backgroundColor;

  const HorizentalProductContainer(
      {Key key,
      @required this.containerTitle,
      @required this.productList,
      @required this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Defaultvalue.defaultFontsize / 4),
      padding: EdgeInsets.all(Defaultvalue.defaultFontsize / 4),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(Defaultvalue.defaultFontsize / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                containerTitle,
                style: TextStyle(fontSize: Defaultvalue.defaultFontsize * 1.5),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                  onPrimary: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
                child: Text(
                  Strings.btnview,
                  style: TextStyle(color: Theme.of(context).backgroundColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: Defaultvalue.defaultFontsize / 4),
        Container(
          height: MediaQuery.of(context).size.height * 0.33,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                Product product = productList[index];
                return ProductWidget(product: product);
              }),
        )
      ]),
    );
  }
}
