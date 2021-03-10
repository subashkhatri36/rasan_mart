import 'package:flutter/material.dart';
import 'package:rasan_mart/data/models/Scroll_banner/scroll_banner_model.dart';
import 'package:rasan_mart/data/models/categories/categories.dart';
import 'package:rasan_mart/data/models/product/product_model.dart';
import 'package:rasan_mart/data/models/product_container/product_container.dart';

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
      productImages: ['https://content.etilize.com/images/900/1022643061.jpg'],
      productCuttedPrice: 260,
      productOnSale: true,
      productDiscount: 23.1,
      productDiscountType: 'Percentage',
      productPrice: 203),
];

List<ProductContainer> get productContainerdata => [
      new ProductContainer(
        layoutindex: 0,
        layoutType: 0,
        backgroundColor: Color(0xfff2f2f2),
        containerTitle: '',
        productList: null,
      ),
      new ProductContainer(
        layoutindex: 2,
        layoutType: 3,
        backgroundColor: Color(0xfff2f2f2),
        containerTitle: '',
        productList: null,
      ),
      new ProductContainer(
        layoutindex: 1,
        layoutType: 4,
        backgroundColor: Color(0xfff2f2f2),
        containerTitle: '',
        productList: null,
      ),
      new ProductContainer(
        layoutindex: 3,
        layoutType: 1,
        backgroundColor: Color(0xfff2f2f2),
        containerTitle: 'Latest Products',
        productList: productlist,
      ),
      new ProductContainer(
        layoutindex: 4,
        layoutType: 1,
        backgroundColor: Color(0xfff2f2f2),
        containerTitle: 'Top Products',
        productList: productlist,
      ),
      new ProductContainer(
        layoutindex: 5,
        layoutType: 1,
        backgroundColor: Color(0xfff2f2f2),
        containerTitle: 'Top Products',
        productList: productlist,
      ),
    ];

List<ScrollBanner> scrollbanner = [
  new ScrollBanner(
    imagepath:
        'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/45b7de97376281.5ec3ca8c1d324.jpg',
    index: 1,
  ),
  new ScrollBanner(
    imagepath:
        'https://cdn.dribbble.com/users/3270761/screenshots/14551267/media/72eb19bdc168197233d791b0c05f2e46.png?compress=1&resize=400x300',
    index: 2,
  ),
  new ScrollBanner(
    imagepath:
        'https://img.freepik.com/free-psd/restaurant-banner-template_23-2148466832.jpg?size=626&ext=jpg',
    index: 3,
  ),
  new ScrollBanner(
    imagepath:
        'https://i.pinimg.com/originals/92/bb/f4/92bbf4d43c8764a36e8568b9fbfbc5bf.jpg',
    index: 4,
  ),
];
List<Categories> get categoriesList => [
      new Categories(
        categoryName: 'GROCERY'.toUpperCase(),
        categoryPath: 'assets/images/glocerry.PNG',
      ),
      new Categories(
        categoryName: 'Baby care'.toUpperCase(),
        categoryPath: 'assets/images/babycare.PNG',
      ),
      new Categories(
          categoryName: 'beverage'.toUpperCase(),
          categoryPath: 'assets/images/foodgrains.PNG'),
      new Categories(
        categoryName: 'branded products'.toUpperCase(),
        categoryPath: 'assets/images/branded.PNG',
      ),
      new Categories(
        categoryName: 'household'.toUpperCase(),
        categoryPath: 'assets/images/household.PNG',
      ),
      new Categories(
        categoryName: 'personal care'.toUpperCase(),
        categoryPath: 'assets/images/personalcare.PNG',
      ),
      new Categories(
        categoryName: 'bakery items'.toUpperCase(),
        categoryPath: 'assets/images/bakery.PNG',
      ),
      new Categories(
        categoryName: 'foodgrains'.toUpperCase(),
        categoryPath: 'assets/images/foodgrains.PNG',
      ),
      new Categories(
        categoryName: 'vegetables'.toUpperCase(),
        categoryPath: 'assets/images/vegetables.PNG',
      ),
      new Categories(
        categoryName: 'household'.toUpperCase(),
        categoryPath: 'assets/images/household.PNG',
      ),
      new Categories(
        categoryName: 'personal care'.toUpperCase(),
        categoryPath: 'assets/images/personalcare.PNG',
      ),
      new Categories(
        categoryName: 'bakery items'.toUpperCase(),
        categoryPath: 'assets/images/bakery.PNG',
      ),
    ];
