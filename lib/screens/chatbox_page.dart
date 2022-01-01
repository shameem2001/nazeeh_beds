import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';
import 'package:nazeeh_beds/constants.dart';

import 'homepage.dart';

class ChatboxPage extends StatefulWidget {
  static const String id = "chatbox_page";
  const ChatboxPage({Key key}) : super(key: key);

  @override
  _ChatboxPageState createState() => _ChatboxPageState();
}

class _ChatboxPageState extends State<ChatboxPage> {

  String message;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          Navigator.popAndPushNamed(context,HomePage.id);
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: CircleAvatar(
                radius: 35,
                child: ClipOval(
                  child: Image.asset('assets/profile2.png', fit: BoxFit.cover,),
                ),
              ),
            ),
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            toolbarHeight: 100,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Eva',
                  style: kblueTextColorNormal,
                ),
                Text('Active now',
                  style: kblueTextColorSmall,
                ),
              ],
            ),
            actions: [
              IconButton(icon: Icon(Icons.close), onPressed:() {
                Navigator.pushReplacementNamed(context, HomePage.id);
              }),
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                color: kprimaryColor,
              ),
            ),
          ),
          body: Stack(
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Today',
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                                ),
                                Bubble(
                                  message: 'Hi How are you ?',
                                  isMe: true,
                                ),
                                Bubble(
                                  message: 'have you seen the docs yet?',
                                  isMe: true,
                                ),
                                Text(
                                  'Oct 25, 2020',
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                                ),
                                Bubble(
                                  message: 'i am fine !',
                                  isMe: false,
                                ),
                                Bubble(
                                  message: 'yes i\'ve seen the docs',
                                  isMe: false,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: kprimaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(onTap: null, child: Icon(FontAwesomeIcons.smile, color: Colors.white, size: 24,)),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width/1.5,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: TextField(
                            onChanged: (value){
                              message = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 18, top: 5),
                              hintText: 'Message',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                              suffixIcon:InkWell(
                                onTap: (){
                                },
                                child: Icon(Icons.mic, color: Colors.black54,),),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(onTap: null, child: Icon(FontAwesomeIcons.camera, color: Colors.white, size: 20,)),
                      GestureDetector(onTap: null, child: Icon(Icons.attach_file_sharp, color: Colors.white, size: 20,)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  final bool isMe;
  final String message;

  Bubble({this.message, this.isMe});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: isMe ? EdgeInsets.only(left: 40) : EdgeInsets.only(right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: isMe
                      ? LinearGradient(
                    colors: [
                      Color(0xFFEAEAEA),
                      Color(0xF1EAEAEA),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
                      : LinearGradient(
                      stops: [0.1,1],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFEAEAEA),
                        Color(0xF1EAEAEA),
                      ]),
                  borderRadius: isMe
                      ? BorderRadius.all(
                    Radius.circular(10.0),
                  )
                      : BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      message,
                      textAlign: isMe ? TextAlign.end : TextAlign.start,
                      style: TextStyle(
                        color: isMe ? Colors.black87 : Colors.black87,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}