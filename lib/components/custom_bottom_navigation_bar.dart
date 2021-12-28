import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nazeeh_beds/screens/cart_page.dart';
import 'package:nazeeh_beds/screens/homepage.dart';
import 'package:nazeeh_beds/screens/profile_page.dart';
import 'package:nazeeh_beds/screens/search_page.dart';
import 'package:nazeeh_beds/screens/wishlist_page.dart';

import '../constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      if(currentIndex == 0)
        Navigator.pushReplacementNamed(context, SearchScreen.id);
      else if(currentIndex == 1)
        Navigator.pushReplacementNamed(context, WishlistPage.id);
      else if(currentIndex == 2)
        Navigator.pushReplacementNamed(context, HomePage.id);
      else if(currentIndex == 3)
        Navigator.pushReplacementNamed(context, CartPage.id);
      else if(currentIndex == 4)
        Navigator.pushReplacementNamed(context, ProfilePage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          CustomPaint(
            size: Size(double.infinity, 60),
            painter: BNBCustomPainter(),
          ),
          Center(
            heightFactor: 0.4,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[400],
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: FaIcon(FontAwesomeIcons.home),
                    iconSize: 28,
                    color: Colors.black,
                    onPressed: (){
                      setBottomBarIndex(2);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.search,
                    size: 22,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("Pressed");
                    setBottomBarIndex(0);
                  },
                  splashColor: Colors.black38,
                ),
                SizedBox(width: 30),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.heart,
                    size: 22,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("Pressed");
                    setBottomBarIndex(1);
                  },
                  splashColor: Colors.black38,
                ),
                SizedBox(width: 120),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.opencart,
                    size: 22,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("Pressed");
                    setBottomBarIndex(3);
                  },
                  splashColor: Colors.black38,
                ),
                SizedBox(width: 30),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.user,
                    size: 22,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("Pressed");
                    setBottomBarIndex(4);
                  },
                  splashColor: Colors.black38,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(
        Offset(size.width * 0.60, 20), radius: Radius.circular(43.0),
        clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}