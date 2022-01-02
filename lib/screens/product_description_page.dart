import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';
import 'package:nazeeh_beds/screens/product_descriptin_pages/product_description_page_1.dart';
import 'package:nazeeh_beds/screens/product_descriptin_pages/product_description_page_2.dart';
import 'package:nazeeh_beds/screens/product_descriptin_pages/product_description_page_3.dart';
import 'package:nazeeh_beds/screens/product_list_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants.dart';
import 'cart_page.dart';

class ProductDescriptionPage extends StatefulWidget {
  static const String id = "product_page";
  const ProductDescriptionPage({Key key}) : super(key: key);

  @override
  _ProductDescriptionPageState createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {

  final List<String> images = [
    'assets/bed_img3.png',
    'assets/bed_img3.png',
    'assets/bed_img3.png'
  ];

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          Navigator.popAndPushNamed(context, ProductListPage.id);
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(
            'Details',
            Icons.arrow_back_ios,
            null,
            null,
            context,
            ProductListPage.id,
            null,
            null,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 12, 24, 0),
            child: Column(
              children: [
                Container(
                  height: 360,
                  color: Colors.white,
                  child: Column(
                    children: [
                        Container(
                          height: 190,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Container(
                                height: 190,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CarouselSlider.builder(
                                    itemCount:images.length,
                                    itemBuilder: (BuildContext context, int index, int realIndex) {
                                      final urlImage = images[index];
                                      return buildImage(context, urlImage, index);
                                    },
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason){
                                        setState(() {
                                          currentIndex = index;
                                          print(currentIndex);
                                        });
                                      },
                                      scrollPhysics: BouncingScrollPhysics(),
                                      autoPlay: false,
                                      enableInfiniteScroll: false,
                                      initialPage: 0,
                                      viewportFraction: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0, 8, 20, 8),
                                  child: buildSmoothIndicator(currentIndex, images.length),
                                ),
                                alignment: Alignment.bottomCenter,
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 2,
                        width: double.infinity,
                        child: Container(color: Colors.grey[300],),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'REPOSE',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: kprimaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    'SPINE PRO - Pocketed Spring',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'with Memory Foam',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '₹35,000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: kprimaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.2
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                color: kprimaryColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.opencart, color: Colors.white,
                                  size: 20,),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, CartPage.id);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2,
                        width: double.infinity,
                        child: Container(color: Colors.grey[300],),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Product',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: kprimaryColor,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                            Text('Detail',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: kprimaryColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text('Reviews',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: kprimaryColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2,
                        width: double.infinity,
                        child: Container(color: Colors.grey[300],),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductSpecs(),
                      ProductDetails(),
                      ProductReviews(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                color: Colors.grey[200],
                spreadRadius: 2,
            ),
                  BoxShadow(
                    color: Colors.grey[100],
                    spreadRadius: 3,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 4,
                  ),
                ],
              color: Colors.grey[300],
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: kprimaryColor,
                    ),
                    child: IconButton( icon: Icon(FontAwesomeIcons.shareAlt, color: Colors.white, size: 22,), onPressed: null)),
                SizedBox(width: 14,),
                Container(
                  width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: kprimaryColor,
                    ),
                    child: IconButton(icon: Icon(FontAwesomeIcons.heart, color: Colors.white, size: 20,), onPressed: null)),
                SizedBox(width: 14,),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: kprimaryColor,
                    ),
                    height: 50,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.opencart, color: Colors.white,),
                        SizedBox(width: 18,),
                        Text(
                          'Go to Cart',
                          style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                          fontSize: 17,
                            color: Colors.white,
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildImage(BuildContext context, String urlImage, int index){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    color: Colors.grey,
    child: Image.asset(
      urlImage,
      fit: BoxFit.cover,
    ),
  );
}

Widget buildSmoothIndicator(int index, int count){
  return AnimatedSmoothIndicator(
    activeIndex: index,
    count: count,
    effect: WormEffect(
      dotHeight: 8,
      dotWidth: 8,
      activeDotColor: kprimaryColor,
    ),
  );
}