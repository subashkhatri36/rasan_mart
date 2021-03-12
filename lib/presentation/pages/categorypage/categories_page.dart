import 'package:flutter/material.dart';
import 'package:rasan_mart/presentation/widgets/Gridview_categories.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: CategoriesGridView(
        istabclick: true,
      ),
    );
  }
}
