import 'package:flutter/material.dart';
import 'package:rasan_mart/core/components/Loadingdata.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/core/constant/strings.dart';
import 'package:rasan_mart/core/enum/enum.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/presentation/widgets/product_widget.dart';

class HorizentalProductContainer extends StatefulWidget {
  final String containerTitle;
  final List<String> productIdList;
  final Color backgroundColor;

  const HorizentalProductContainer(
      {Key key,
      @required this.containerTitle,
      @required this.productIdList,
      @required this.backgroundColor})
      : super(key: key);

  @override
  _HorizentalProductContainerState createState() =>
      _HorizentalProductContainerState();
}

class _HorizentalProductContainerState
    extends State<HorizentalProductContainer> {
  //List<Product> newProduct = [];
  int a = 0;

  Future<List<Product>> loadingdata() async {
    return await loaddata(id: widget.productIdList);
  }

  @override
  void initState() {
    //initalize product

    super.initState();
  }

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
          height: MediaQuery.of(context).size.height * 0.33,
          child: FutureBuilder(
            builder: (context, snapshot) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    Product oneproduct = snapshot.data[index];

                    return ProductWidget(
                      product: oneproduct,
                      contianerType: ContianerType.HorizentalLayout,
                    );
                  });
            },
            future: loadingdata(),
          ),
        )
      ]),
    );
  }
}
