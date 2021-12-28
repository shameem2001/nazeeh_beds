import 'package:flutter/material.dart';

import '../constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: klightPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Row(
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
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Eva',
                          style: kblueTextColorNormal,
                        ),
                        Text('abc@gmail.com',
                          style: kblueTextColorSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Edit',
                  style: kblueTextColorSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}