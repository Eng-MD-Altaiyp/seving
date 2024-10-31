import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:seving/Models/Models_And_Classes/Colors.dart';
import 'package:seving/first%20page/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'Models/Models_And_Classes/Classes _and_barameters.dart';
import 'Screens/User_Setting_Account/User_Setting_Account.dart';
import 'first page/signup_screen.dart';
import 'first page/splash_screen.dart';
import 'localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _setLocale(Locale locale) {
    setState(() {
      locale_g = locale;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      checkUserData();
    });
  }
  Future<bool> checkUserData() async {
    var user = await data_metter.readData('SELECT * FROM Users');
    if (user.isNotEmpty) {
      Map<String, dynamic> userData = user.first;
      User_ID = userData['user_id'];
      User_Names = userData['user_name'];
      User_Email = userData['user_email'];
      Passs = userData['user_password'];
      // selectedLanguage = userData['language'];
      // Repeat = userData['Repeat'];
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => Navigetor_Pages()));
    }
    else {
      User_Names = 'User';
      User_Email = 'Seving@gmail.com';
      Passs = '1234';
      User_ID = 0;
      // selectedLanguage = 'Arabic';

      // Repeat = true;
    }
    print('lllllllllllllllllllllllllllllllllllllllllllllllllll $selectedLanguage');
    var count = await data_metter.readData('SELECT COUNT(*) FROM Users');
    int userDataCount = Sqflite.firstIntValue(count)!;
    return userDataCount > 0;
  }


  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MaterialApp(
        title: "Seving",
        debugShowCheckedModeBanner: false,
        color: On_Of_color,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'SA'),
        ],
        locale: locale_g,
        home:
        FutureBuilder<bool>(
          future: checkUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
                return SplashScreen(test: true);
              } else {
                return SplashScreen(test:false);
              }
            } else {
              return  SplashScreen(test:false);
            }
          },
        ),
        // Navigetor_Pages(),
        // SplashScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/Settings': (context) => Settings_Account(setLocale: _setLocale)
        },
      ),
    );
  }
}
