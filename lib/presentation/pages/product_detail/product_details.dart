import 'package:flutter/material.dart';
import 'package:rasan_mart/core/components/box_border.dart';
import 'package:rasan_mart/core/components/discount.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/enum/enum_convertor.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/data/repositories/alldata.dart';
import 'package:rasan_mart/presentation/pages/product_detail/widgets/product_images_details.dart';
import 'package:rasan_mart/presentation/widgets/amount_box.dart';
import 'package:rasan_mart/presentation/widgets/cart_and_quickview_btn.dart';
import 'package:rasan_mart/presentation/widgets/horizental_product_container.dart';
import 'package:rasan_mart/presentation/widgets/product_detail_container.dart';
import 'package:rasan_mart/presentation/widgets/quantity_and_totalprice_container.dart';
import 'package:rasan_mart/presentation/widgets/total_product_price.dart';

class ProductDetails extends StatefulWidget {
  final Product productDetails;

  const ProductDetails({Key key, @required this.productDetails})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  EnumConvertor enumConvertor = EnumConvertor();
  Product get _product => widget.productDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _product.productName,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: Defaultvalue.defaultFontsize + 5,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageDetails(
                  product: _product,
                ),
                SizedBox(height: Defaultvalue.defaultFontsize / 2),
                Container(
                    decoration: buildBoxDecoration(
                        bgcolor: Theme.of(context).backgroundColor,
                        round: false,
                        shadow: false),
                    margin: EdgeInsets.only(left: Defaultvalue.defaultFontsize),
                    padding: EdgeInsets.all(Defaultvalue.defaultFontsize / 2),
                    child: Text(
                      discountString(
                            discountType: _product.productDiscountType,
                            discountAmount: _product.productDiscount.toString(),
                          ) +
                          ' OFF',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: Defaultvalue.defaultFontsize),
                  child: AmountBox(
                    product: _product,
                    isdetailpage: true,
                  ),
                ),
                SizedBox(height: 10),
                ProductDetailContainer(
                    productDetail: _product.productDescription),
                QuantityAndTotalpriceContainer(
                  product: _product,
                  isdetailpage: true,
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(Defaultvalue.defaultPadding),
                  padding: EdgeInsets.all(Defaultvalue.defaultPadding),
                  decoration: buildBoxDecoration(
                      bgcolor: Colors.transparent, round: true, shadow: false),
                  child: buildCartAndQuick(true, context),
                ),
                SizedBox(height: 10),
                HorizentalProductContainer(
                  containerTitle: 'SImilar Products',
                  backgroundColor: Colors.transparent,
                  productIdList: productContainerdata[3].productIdList,
                ),
                SizedBox(height: Defaultvalue.defaultPadding)
              ],
            )),
      ),
    );
  }
}
