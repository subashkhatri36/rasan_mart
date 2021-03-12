import 'package:flutter/material.dart';
import 'package:rasan_mart/core/components/box_border.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';

class ProductImageDetails extends StatefulWidget {
  final Product product;

  const ProductImageDetails({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _ProductImageDetailsState createState() => _ProductImageDetailsState();
}

class _ProductImageDetailsState extends State<ProductImageDetails> {
  int _selectedImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: Defaultvalue.defaultFontsize),
          padding: EdgeInsets.all(Defaultvalue.defaultFontsize) / 2,
          child: Column(children: [
            Hero(
              tag: widget.product.productId,
              key: ValueKey(widget.product.productId),
              child: Image.network(
                widget.product.productImages[_selectedImageIndex],
                height: MediaQuery.of(context).size.height * .3,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: widget.product.productImages
                    .map((path) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImageIndex =
                                  widget.product.productImages.indexOf(path);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: buildBoxDecoration(
                                bgcolor: Colors.transparent,
                                shadow: false,
                                round: false),
                            child: Image.network(
                              path,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
          ])),
    );
  }
}
