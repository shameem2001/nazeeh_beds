import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';
import 'package:nazeeh_beds/constants.dart';
import 'package:nazeeh_beds/screens/cart_page.dart';
import 'package:nazeeh_beds/screens/chatbox_page.dart';
import 'package:nazeeh_beds/screens/notification_page.dart';
import 'package:nazeeh_beds/screens/product_description_page.dart';
import 'homepage.dart';

class ProductListPage extends StatefulWidget {
  static const String id = "product_list_page";
  const ProductListPage({Key key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          Navigator.popAndPushNamed(context, HomePage.id);
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar('Mattresses', Icons.arrow_back_ios, Icons.chat, Icons.notifications, context, HomePage.id, ChatboxPage.id, NotificationPage.id),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SearchBar(),
              CardWidget(),
            ],
        ),
          bottomNavigationBar: Container(
            color: kprimaryColor,
            height: 50,
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width/3 - 1.25,
                  child: Center(
                    child: Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: double.infinity,
                  width: 2,
                  child: Container(color: Colors.grey[400],),
                ),
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width/3 - 1.5,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.sort, color: Colors.white, size: 20,),
                        SizedBox(width: 5,),
                        Text(
                          'Sort by',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: double.infinity,
                  width: 2,
                  child: Container(color: Colors.grey[400],),
                ),
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width/3 - 1.25,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.filter, color: Colors.white, size: 20,),
                        SizedBox(width: 5,),
                        Text(
                          'Filter',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {

  List data = [
    {"color": Colors.white},
    {"color": Colors.white},
    {"color": Colors.white},
    {"color": Colors.white},
    {"color": Colors.white},
    {"color": Colors.white},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          //crossAxisSpacing: 10,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 6),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, ProductDescriptionPage.id);
              },
              child: Card(
                elevation: 5,
                color: data[index]['color'],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 210,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/bed_img.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                      width: double.infinity,
                      child: Container(
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Repose',
                                  style: GoogleFonts.poppins(
                                    color: kprimaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Extraordinary special edition',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '₹22,000',
                                  style: GoogleFonts.poppins(
                                      color: kprimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
