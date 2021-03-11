import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/data/repositories/alldata.dart';

Future inisalizedata(List<String> id) async {
  List<Product> newProduct = [];
  for (int i = 0; i < productlist.length; i++) {
    for (int j = 0; j < id.length; j++) {
      if (productlist[i].productId == id[j]) {
        newProduct.add(productlist[i]);
      }
    }
  }

  return newProduct;
}

Future<List<Product>> loaddata({List<String> id}) async {
  return await inisalizedata(id);
}
