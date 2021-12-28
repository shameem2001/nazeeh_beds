import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';
import 'package:nazeeh_beds/screens/chatbox_page.dart';
import 'package:nazeeh_beds/screens/notification_page.dart';

import '../constants.dart';
import 'homepage.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = "register_screen";
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isVisible = false;
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          moreLighterPrimaryColor,
                          lighterPrimaryColor,
                          lightPrimaryColor,
                          primaryColor,
                        ],
                      )
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text('Register', style: GoogleFonts.raleway(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                        SizedBox(height: 30),
                        buildTextField('Username', Icons.person, false, TextInputType.name),
                        buildTextField('Email Address', Icons.email, false, TextInputType.emailAddress),
                        buildTextField('Phone number', Icons.phone, false, TextInputType.number),
                        buildTextField('Password', Icons.lock, true, TextInputType.text),
                        buildTextField('Confirm password', Icons.lock, true, TextInputType.text),
                        SizedBox(height: 20),
                        buildCheckbox(),
                        SizedBox(height: 20),
                        buildSignUpBtn(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),),
      ),
    );
  }

  Widget buildTextField(String text, IconData icon, bool isHidden, TextInputType type) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            height: 60,
            child: TextField(
              keyboardType: type,
              style: TextStyle(
                color: Colors.black87,
              ),
              obscureText: !isVisible,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  icon,
                  color: primaryColor,
                ),
                hintText: text,
                suffixIcon: isHidden == true? InkWell(
                  onTap: (){
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(isVisible?Icons.visibility: Icons.visibility_off, color: primaryColor,),)
                    : null,
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckbox(){
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 20,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isAgree,
              activeColor: Colors.white,
              checkColor: primaryColor,
              onChanged: (value){
                setState(() {
                  isAgree = value;
                });
              },
            ),
          ),
          RichText(
            text:TextSpan(
              children: [
                TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'privacy policies',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSignUpBtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: (){
          print("Login Pressed");
          Navigator.pushReplacementNamed(context, HomePage.id);
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.white,
      ),
    );
  }

}
