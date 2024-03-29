import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nazeeh_beds/screens/address_page.dart';
import 'package:nazeeh_beds/screens/cart_page.dart';
import 'package:nazeeh_beds/screens/chatbox_page.dart';
import 'package:nazeeh_beds/screens/checkout_page.dart';
import 'package:nazeeh_beds/screens/edit_profile_page.dart';
import 'package:nazeeh_beds/screens/homepage.dart';
import 'package:nazeeh_beds/screens/login_screen.dart';
import 'package:nazeeh_beds/screens/notification_page.dart';
import 'package:nazeeh_beds/screens/payment_page.dart';
import 'package:nazeeh_beds/screens/product_description_page.dart';
import 'package:nazeeh_beds/screens/product_list_page.dart';
import 'package:nazeeh_beds/screens/profile_page.dart';
import 'package:nazeeh_beds/screens/register_screen.dart';
import 'package:nazeeh_beds/screens/search_page.dart';
import 'package:nazeeh_beds/screens/splash_screen.dart';
import 'package:nazeeh_beds/screens/track_order_page.dart';
import 'package:nazeeh_beds/screens/wishlist_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(NazeehBeds());
}

class NazeehBeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges,
        initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.white,
        ),
        initialRoute: SplashScreen.id,
        routes: {
          AuthenticationWrapper.id: (context) => DoubleBack(
            message: "Press back again to exit",
            child: AuthenticationWrapper(),
          ),
          SplashScreen.id: (context) => SplashScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          HomePage.id: (context) => HomePage(),
          SearchScreen.id: (context) => SearchScreen(),
          WishlistPage.id: (context) => WishlistPage(),
          CartPage.id: (context) => CartPage(),
          ProfilePage.id: (context) => ProfilePage(),
          EditProfilePage.id: (context) => EditProfilePage(),
          NotificationPage.id: (context) => NotificationPage(),
          ChatboxPage.id: (context) => ChatboxPage(),
          ProductListPage.id: (context) => ProductListPage(),
          ProductDescriptionPage.id: (context) => ProductDescriptionPage(),
          AddressPage.id: (context) => AddressPage(),
          CheckoutPage.id: (context) => CheckoutPage(),
          PaymentPage.id: (context) => PaymentPage(),
          TrackOrderPage.id: (context) => TrackOrderPage(),
        },
      ),
    );
  }
}

