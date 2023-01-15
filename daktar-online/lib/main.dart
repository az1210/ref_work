import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import './utils/colors.dart';
import './screens/splash_screen.dart';
import './providers/auth_provider.dart';
import './screens/auth_screen.dart';
import './screens/user/user_home_screen.dart';
import './screens/doctor/doc_reg_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Online',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        appBarTheme: AppBarTheme(
          color: AppColors.primarySoftColor,
          iconTheme: const IconThemeData(color: AppColors.primaryColor),
          titleTextStyle: GoogleFonts.raleway(
              fontWeight: FontWeight.w700,
              color: AppColors.secondaryColor,
              fontSize: 20),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(AppColors.secondaryColor),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 146, 144, 144),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              // style: BorderStyle.solid,
              color: Colors.black,
            ),
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 14,
                fontFamily: 'Railway',
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
              headline2: const TextStyle(
                fontSize: 14,
                fontFamily: 'Railway',
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
              headline3: const TextStyle(
                fontSize: 19,
                fontFamily: 'Railway',
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryColor,
              ),
              bodyText1: const TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black87,
                fontSize: 16,
              ),
              bodyText2: const TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black45,
                fontSize: 14,
              ),
              subtitle1: GoogleFonts.roboto(
                fontSize: 18,
                // fontFamily: 'Railway',
                // fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              subtitle2: GoogleFonts.roboto(
                fontSize: 14,
                // fontFamily: 'Railway',
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
              button: const TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 14,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color.fromRGBO(199, 52, 50, 0.8)),
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: const Text(
          'Doctor Online',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 183, 186),
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.bottomToTop,

        nextScreen: AuthScreen(),
        // auth.isAuth
        //     ? ProductsOverviewScreen()
        //     : FutureBuilder(
        //         future: auth.tryAutoLogin(),
        //         builder: (ctx, authResultSnapshot) =>
        //             authResultSnapshot.connectionState ==
        //                     ConnectionState.waiting
        //                 ? SplashScreen()
        //                 : AuthScreen(),
      ),
      getPages: [
        GetPage(name: '/doc-reg-screen', page: () => DocRegScreen()),
      ],
    );
  }
}
