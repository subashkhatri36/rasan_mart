import 'package:flutter/material.dart';

import 'package:rasan_mart/data/models/product/product_container.dart';
import 'package:rasan_mart/data/repositories/alldata.dart';
import 'package:rasan_mart/presentation/pages/categorypage/categories_page.dart';
import 'package:rasan_mart/presentation/pages/homepage/widgets/body_widgets.dart';
import 'package:rasan_mart/presentation/pages/myaccountpage/myaccount.dart';
import 'package:rasan_mart/presentation/widgets/appbar/app_bar.dart';
import 'package:rasan_mart/presentation/widgets/bottomNavigation/bottom_navigationbar.dart';
import 'package:rasan_mart/presentation/widgets/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool isScroll = true;

  bool _showSearchBar = false;
  ScrollController scrollController = ScrollController();
  double _scrollPosition;
  @override
  void initState() {
    productContainer = productContainerdata;
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    setState(() {
      _scrollPosition = scrollController.position.pixels;

      if (_scrollPosition > 75) {
        _showSearchBar = true;
      } else {
        _showSearchBar = false;
      }
    });
  }

  int _selectedIndex = 0;

  List<ProductContainer> productContainer;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex != 0) _showSearchBar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, _showSearchBar),
      body: returnScreenValue(_selectedIndex),
      drawer: AppDrawer(),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget returnScreenValue(int _index) {
    switch (_index) {
      case 0:
        return Home(
            scrollController: scrollController,
            productContainer: productContainer);
        break;
      case 1:
        return Text('');
        break;

      case 2:
        return CategoriesPage();
        break;
      case 3:
        return MyAccount();
        break;
      default:
        return null;
        break;
    }
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

  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(() {});
    super.dispose();
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
    @required this.scrollController,
    @required this.productContainer,
  }) : super(key: key);

  final ScrollController scrollController;
  final List<ProductContainer> productContainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                controller: scrollController,
                itemCount: productContainer.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  //checking file is banner or not first
                  return homebody(
                      productContainer: productContainer,
                      index: index,
                      context: context);
                }),
          ),
        ),
      ],
    );
  }
}
