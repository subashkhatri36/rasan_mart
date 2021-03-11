import 'package:flutter/material.dart';
import 'package:rasan_mart/data/models/product/product_container.dart';
import 'package:rasan_mart/data/repositories/alldata.dart';
import 'package:rasan_mart/presentation/pages/homepage/widgets/body_widgets.dart';
import 'package:rasan_mart/presentation/widgets/appbar/app_bar.dart';
import 'package:rasan_mart/presentation/widgets/bottomNavigation/bottom_navigationbar.dart';
import 'package:rasan_mart/presentation/widgets/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool isScroll = true;

  bool _showAppbar = true;
  bool isScrollingDown = false;
  int _selectedIndex = 0;

  List<ProductContainer> productContainer;

  @override
  void initState() {
    productContainer = productContainerdata;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, _showAppbar),
      body: HomeBody(productContainer: productContainer),
      drawer: AppDrawer(),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: navItemsList,
      currentIndex: _selectedIndex,
      selectedIconTheme: IconThemeData(color: Colors.red),
      selectedItemColor: Theme.of(context).backgroundColor,
      onTap: _onItemTapped,
    );
  }
}
