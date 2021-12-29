import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
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
                          shrinkWrap: true,
                          crossAxisCount: 1,
                          mainAxisSpacing: 20.0,
                          children: [
                            Container(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: buildTile(
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(24.0, 10, 24, 0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Orders', style: kProfileDetailsTextStyle,),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Wallet',
                                        style: kProfileDetailsTextStyle,
                                        ),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('My Rewards', style: kProfileDetailsTextStyle,),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Invite friend and Earn', style: kProfileDetailsTextStyle,),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Customer Care', style: kProfileDetailsTextStyle,),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: buildTile(
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(24.0, 10, 24, 0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Address', style: kProfileDetailsTextStyle,),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Payment',
                                          style: kProfileDetailsTextStyle,
                                        ),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Shipping', style: kProfileDetailsTextStyle,),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Notification', style: kProfileDetailsTextStyle,),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Language', style: kProfileDetailsTextStyle,),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                      child: ListTile(
                                        onTap: null,
                                        title: Text('Terms and Conditions', style: kProfileDetailsTextStyle,),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          staggeredTiles: [
                            StaggeredTile.extent(1, 20.0),
                            StaggeredTile.extent(1, 300.0),
                            StaggeredTile.extent(1, 350.0),
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
