import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/data/models/categories/categories.dart';
import 'package:rasan_mart/data/repositories/alldata.dart';

class CategoriesGridView extends StatefulWidget {
  final bool istabclick;

  const CategoriesGridView({Key key, @required this.istabclick})
      : super(key: key); // = false;
  @override
  _CategoriesGridViewState createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  bool istabclick; // = widget.istabclick;
  List<Categories> categories;
  @override
  void initState() {
    //initalie need to be future builder because it come from api
    categories = categoriesList;
    istabclick = widget.istabclick ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!istabclick)
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
            child: istabclick ? buildListView() : buildGridView(context),
          ),
        ],
      ),
    );
  }

//creating listview for the categories tabs
  ListView buildListView() => ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(
            categories[index].categoryPath,
            fit: BoxFit.cover,
            height: Defaultvalue.defaultPadding * 2,
          ),
          title: Text(
            categories[index].categoryName,
            overflow: TextOverflow.fade,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Defaultvalue.defaultFontsize),
            maxLines: 2,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      });

  GridView buildGridView(BuildContext context) {
    return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 4,
        mainAxisSpacing: 3,
        crossAxisCount: istabclick ? 3 : 4,
        children: List.generate(
          categories.length > 8 ? 8 : categories.length,
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
        ));
  }
}
