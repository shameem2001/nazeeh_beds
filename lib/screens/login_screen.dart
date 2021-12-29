import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nazeeh_beds/authentication_service.dart';
import 'package:nazeeh_beds/constants.dart';
import 'package:nazeeh_beds/screens/homepage.dart';
import 'package:nazeeh_beds/screens/register_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_page";
  const LoginScreen({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginScreen> {

  bool isRememberMe = false;
  bool isVisible = false;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          return false;
        }
      },
      child: SafeArea(
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
                          kmoreLighterPrimaryColor,
                          klighterPrimaryColor,
                          klightPrimaryColor,
                          kprimaryColor,
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
                            child: Text('Welcome', style: GoogleFonts.raleway(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                          SizedBox(height: 30),
                          buildEmailField('Email', Icons.email, false, TextInputType.emailAddress),
                          buildPasswordField('Password', Icons.lock, true, TextInputType.text),
                          buildForgotPasswordBtn(),
                          buildRememberMeBtn(),
                          buildLoginBtn(),
                          buildSignUpBtn(),
                          SizedBox(height: 20),
                          buildSignInWithText(),
                          buildSocialBtn(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),),
        ),
      ),
    );
  }

  Widget buildEmailField(String text, IconData icon, bool isHidden, TextInputType type) {
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
              onChanged: (value){
                email = value;
              },
              keyboardType: type,
              style: TextStyle(
                color: Colors.black87,
              ),
              obscureText: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  icon,
                  color: kprimaryColor,
                ),
                hintText: text,
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

  Widget buildPasswordField(String text, IconData icon, bool isHidden, TextInputType type) {
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
              onChanged: (value){
                password = value;
              },
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
                  color: kprimaryColor,
                ),
                hintText: text,
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
                suffixIcon: isHidden == true? InkWell(
                  onTap: (){
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(isVisible?Icons.visibility: Icons.visibility_off, color: kprimaryColor,),)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForgotPasswordBtn(){
    return Container(
      padding: EdgeInsets.only(right: 20),
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: (){
          print("Forgot Password Button Pressed.");
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildRememberMeBtn(){
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 20,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              activeColor: Colors.white,
              checkColor: kprimaryColor,
              onChanged: (value){
                setState(() {
                  isRememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember Me',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginBtn(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: (){
          print("Login Pressed");
          context.read<AuthenticationService>().signInWithEmailAndPassword(
            email: email,
            password: password,
            context: context
          );
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: kprimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.white,
      ),
    );
  }

  Widget buildSignUpBtn(){
    return GestureDetector(
      onTap: (){
        print("Sign up Pressed");
        Navigator.pushReplacementNamed(context, RegisterScreen.id);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Dont\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget buildSocialBtn() {
    return GestureDetector(
      onTap: ()  async{
        await context.read<AuthenticationService>().signInWithGoogle();
        await Navigator.pushReplacementNamed(context, HomePage.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 20,
        ),
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage('assets/google_icon.jpg'),
          ),
        ),
        //child: Icon(FontAwesomeIcons.google, size: 26,),
      ),
    );
  }
}
