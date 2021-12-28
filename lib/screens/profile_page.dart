import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nazeeh_beds/components/custom_profile_header.dart';
import 'package:nazeeh_beds/constants.dart';

import 'homepage.dart';

class ProfilePage extends StatefulWidget {
  static const String id = "profile_page";
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          body: Container(
            color: kprimaryColor,
            child: Column(
              children: [
                ProfileHeader(),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: StaggeredGridView.count(
                          shrinkWrap: false,
                          crossAxisCount: 1,
                          mainAxisSpacing: 20.0,
                          children: [
                            Container(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: buildTile(
                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Daily Usage',
                                              style: TextStyle(color: Colors.blueAccent, fontSize: 16.0)),
                                          SizedBox(height: 5,),
                                          Text(' 18 units',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30.0))
                                        ],
                                      ),
                                      Material(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Icon(Icons.timeline,
                                                color: Colors.white, size: 30.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: buildTile(
                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Daily Usage',
                                              style: TextStyle(color: Colors.blueAccent, fontSize: 16.0)),
                                          SizedBox(height: 5,),
                                          Text(' 18 units',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30.0))
                                        ],
                                      ),
                                      Material(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Icon(Icons.timeline,
                                                color: Colors.white, size: 30.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: buildTile(
                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Daily Usage',
                                              style: TextStyle(color: Colors.blueAccent, fontSize: 16.0)),
                                          SizedBox(height: 5,),
                                          Text(' 18 units',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30.0))
                                        ],
                                      ),
                                      Material(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Icon(Icons.timeline,
                                                color: Colors.white, size: 30.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                          staggeredTiles: [
                            StaggeredTile.extent(1, 20.0),
                            StaggeredTile.extent(1, 400.0),
                            StaggeredTile.extent(1, 400.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),),
              ],
            ),
          ),
        ),
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
}

