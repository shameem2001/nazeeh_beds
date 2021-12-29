import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nazeeh_beds/components/custom_app_drawer.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';
import 'package:nazeeh_beds/components/custom_bottom_navigation_bar.dart';
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
          padding: const EdgeInsets.symmetric(vertical:20, horizontal: 20),
          children: [
            buildTile(
              Container(
                height: 150,
                width: double.infinity,
                child:Text("Hello"),
              ),
              onTap:(){},
            ),
            SizedBox(height: 30,),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'New Arrivals',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 160.0,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _buildItem(context, large: true);
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 24,
                      letterSpacing: 1.5,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemExtent: 160.0,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _buildItem(context, large: true);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
          ),
        );
  }
}

Widget _buildItem(BuildContext context, {bool large = false}) {
  return Container(
    margin: EdgeInsets.only(right: 20),
    width: 120,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: AssetImage('assets/background_image.png'),
            fit: BoxFit.cover,
          )),
      height: 120,
    ),
  );
}

Widget buildTile(Widget child, {Function() onTap}) {
  return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Colors.grey[400],
      child: InkWell(
        // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : null,
          child: child));
}

