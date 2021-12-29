import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nazeeh_beds/screens/profile_page.dart';

import '../constants.dart';
import 'homepage.dart';

class EditProfilePage extends StatefulWidget {
  static const String id = "edit_profile_page";
  const EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          Navigator.popAndPushNamed(context, ProfilePage.id);
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: kprimaryColor,
            child: Column(
              children: [
                Container(
                  color: klightPrimaryColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                              child: CircleAvatar(
                                radius: 35,
                                child: ClipOval(
                                  child: Image.asset('assets/profile2.png', height: 150, width: 150, fit: BoxFit.cover,),
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.popAndPushNamed(context, ProfilePage.id);
                          },
                          icon: Icon(Icons.exit_to_app, size: 30, color: Colors.white70,),
                        ),
                      ],
                    ),
                  ),
                ),
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
                            ],
                            staggeredTiles: [
                              StaggeredTile.extent(1, 20.0),
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
}
