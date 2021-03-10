import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/data/models/categories/categories.dart';
import 'package:rasan_mart/data/repositories/alldata.dart';

class CategoriesGridView extends StatefulWidget {
  @override
  _CategoriesGridViewState createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  List<Categories> categories;
  @override
  void initState() {
    //initalie
    categories = categoriesList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: Defaultvalue.defaultFontsize),
            child: Text(
              'Categories',
              style: TextStyle(
                  fontSize: Defaultvalue.defaultFontsize + 5,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: Defaultvalue.defaultFontsize),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Defaultvalue.defaultFontsize / 2),
            child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 3,
                mainAxisSpacing: 8,
                crossAxisCount: 5,
                children: List.generate(
                  categories.length,
                  (index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.10,
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            categories[index].categoryPath,
                            fit: BoxFit.cover,
                            height: Defaultvalue.defaultPadding * 2,
                          ),
                          SizedBox(height: Defaultvalue.defaultFontsize / 3),
                          Text(
                            categories[index].categoryName,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Defaultvalue.defaultFontsize / 1.2),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
