import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rasan_mart/core/themes/app_theme.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/data/models/product_container/product_container.dart';
import 'package:rasan_mart/presentation/drawer/drawer.dart';
import 'package:rasan_mart/presentation/pages/homepage/appbar/app_bar.dart';
import 'package:rasan_mart/presentation/pages/homepage/widgets/body_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool isScroll = true;

  bool _showAppbar = false;
  bool isScrollingDown = false;
  int _selectedIndex = 0;

  List<Product> productlist = [
    Product(
        productOnDiscount: false,
        productName: 'Almonds Almonds AlmondsA lmondsAl mond  sAlmondsAlmonds',
        productImages: [
          'https://images.indianexpress.com/2015/04/biscuit-main.jpg',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSptLHALWW_lkrl4AbHF9peot3RxC81RRzUKQ&usqp=CAU',
        ],
        productCuttedPrice: 260,
        productOnSale: false,
        productDiscount: 23.1,
        productDiscountType: 'Percentage',
        productPrice: 200),
    Product(
        productOnDiscount: true,
        productName: 'Makhana',
        productImages: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlDqUJfS4Pjql3SF9XzAsbZglCj29x0exKbw&usqp=CAU'
        ],
        productCuttedPrice: 260,
        productOnSale: true,
        productDiscount: 23.1,
        productDiscountType: 'Percentage',
        productPrice: 201),
    Product(
        productOnDiscount: true,
        productName: 'Nariwal',
        productImages: [
          'https://www.nextbigbrand.in/wp-content/uploads/2020/03/parle-agencies.jpg'
        ],
        productCuttedPrice: 260,
        productOnSale: true,
        productDiscount: 23.1,
        productDiscountType: 'Percentage',
        productPrice: 202),
    Product(
        productOnDiscount: true,
        productName: 'Misri',
        productImages: [
          'https://content.etilize.com/images/900/1022643061.jpg'
        ],
        productCuttedPrice: 260,
        productOnSale: true,
        productDiscount: 23.1,
        productDiscountType: 'Percentage',
        productPrice: 203),
  ];
  List<ProductContainer> productContainer;

  List<BottomNavigationBarItem> navItemsList = [
    BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.home,
        color: AppTheme.lightAccentColor,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart,
        color: AppTheme.lightAccentColor,
      ),
      label: 'cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.tags,
        color: AppTheme.lightAccentColor,
      ),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.userCircle,
        color: AppTheme.lightAccentColor,
      ),
      label: 'Account',
    ),
  ];

  @override
  void initState() {
    productContainer = [
      new ProductContainer(
          layoutType: 1,
          backgroundColor: Color(0xfff2f2f2),
          containerTitle: 'Latest Products',
          productList: productlist),
      new ProductContainer(
          layoutType: 1,
          backgroundColor: Color(0xfff2f2f2),
          containerTitle: 'Top Products',
          productList: productlist),
      new ProductContainer(
          layoutType: 1,
          backgroundColor: Color(0xfff2f2f2),
          containerTitle: 'Top Products',
          productList: productlist),
    ];
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
      bottomNavigationBar: BottomNavigationBar(
        items: navItemsList,
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(color: Colors.red),
        selectedItemColor: Theme.of(context).backgroundColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
