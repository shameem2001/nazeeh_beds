import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nazeeh_beds/components/custom_app_drawer.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';
import 'package:nazeeh_beds/components/custom_bottom_navigation_bar.dart';
import 'package:nazeeh_beds/screens/product_list_page.dart';
import '../constants.dart';
import 'chatbox_page.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
            'Nazeeh Beds',
            null,
            FontAwesomeIcons.comments,
            Icons.notifications,
            context,
            null,
            ChatboxPage.id,
            NotificationPage.id,
        ),
        drawer: CustomDrawer(),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: buildTile(
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage('assets/banner_img.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.centerRight,
                      ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black87,
                        Colors.black54,
                      ],
                    ),
                  ),
                ),
                onTap:(){
                  Navigator.pushReplacementNamed(context, ProductListPage.id);
                },
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'New Arrivals',
                      style: kHomePageHeaderTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemExtent: 330.0,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return _buildItem1(context, 10, large: true);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 30),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Featured',
                      style: kHomePageHeaderTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 160,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemExtent: 250.0,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return _buildItem2(context, 40,  large: true);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
          ),
        );
  }
}

Widget _buildItem1(BuildContext context, double marginSize, {bool large = false}) {
  return GestureDetector(
    onTap: (){
      Navigator.pushReplacementNamed(context, ProductListPage.id);
    },
    child: Card(
      shadowColor: Colors.black54,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Container(
        margin: EdgeInsets.only(right: marginSize),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage('assets/bed_img.png'),
                fit: BoxFit.cover,
              )),
          height: 120,
        ),
      ),
    ),
  );
}

Widget _buildItem2(BuildContext context, double marginSize, {bool large = false}) {
  return GestureDetector(
    onTap: (){
      Navigator.pushReplacementNamed(context, ProductListPage.id);
    },
    child: Card(
      shadowColor: Colors.black54,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Container(
        margin: EdgeInsets.only(right: marginSize),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage('assets/bed_img2.png'),
                fit: BoxFit.cover,
              )),
          height: 120,
        ),
      ),
    ),
  );
}

Widget buildTile(Widget child, {Function() onTap}) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(20.0),
      shadowColor: Colors.grey[400],
      child: InkWell(
        // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : null,
          child: child));
}
