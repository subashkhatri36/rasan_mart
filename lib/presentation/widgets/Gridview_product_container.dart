import 'package:flutter/material.dart';
import 'package:rasan_mart/core/components/Loadingdata.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/constant/strings.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/presentation/widgets/product_widget.dart';

class GridViewProduct extends StatefulWidget {
  final String containerTitle;
  final List<String> productIdList;
  final Color backgroundColor;

  const GridViewProduct({
    Key key,
    @required this.containerTitle,
    @required this.productIdList,
    @required this.backgroundColor,
  }) : super(key: key);
  @override
  _GridViewProductState createState() => _GridViewProductState();
}

class _GridViewProductState extends State<GridViewProduct> {
  Future<List<Product>> loadingdata() async {
    return await loaddata(id: widget.productIdList);
  }

  @override
  void initState() {
    //initalie
    loadingdata();
    setState(() {
      loadingdata();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Defaultvalue.defaultFontsize / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.containerTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Defaultvalue.defaultFontsize * 1.5),
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
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .62,
            padding: EdgeInsets.symmetric(
                horizontal: Defaultvalue.defaultFontsize / 2),
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      return snapshot.data != null
                          ? GridViewProductData(newProduct: snapshot.data)
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                    future: loadingdata(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GridViewProductData extends StatelessWidget {
  const GridViewProductData({
    Key key,
    @required this.newProduct,
  }) : super(key: key);

  final List<Product> newProduct;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        childAspectRatio: .8,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 2,
        mainAxisSpacing: 3,
        crossAxisCount: 2,
        children: List.generate(
          newProduct.length > 4 ? 4 : newProduct.length,
          (index) {
            Product oneproduct = newProduct[index];
            return ProductWidget(
              product: oneproduct,
              contianerType: ContianerType.GridviewLayout,
            );
          },
        ));
  }
}
