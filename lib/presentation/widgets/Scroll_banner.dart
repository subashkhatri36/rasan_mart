import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';
import 'package:rasan_mart/data/models/Scroll_banner/scroll_banner_model.dart';
import 'package:rasan_mart/data/repositories/alldata.dart';

class BannerScrollImage extends StatefulWidget {
  @override
  _BannerScrollImageState createState() => _BannerScrollImageState();
}

class _BannerScrollImageState extends State<BannerScrollImage> {
  List<ScrollBanner> banner;

  List<Widget> imageSliders;

  @override
  void initState() {
    this.banner = scrollbanner;

    imageSliders = banner
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(2.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item.imagepath,
                            fit: BoxFit.cover, width: 1000.0),
                      ],
                    )),
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Defaultvalue.defaultFontsize),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
