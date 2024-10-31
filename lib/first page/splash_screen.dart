import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seving/Models/Models_And_Classes/Colors.dart';
import 'package:seving/first%20page/signup_screen.dart';
import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Navigetor_Pages.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
  final bool test;
  const SplashScreen({super.key,required this.test});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() async{
    if(widget.test == true) {
      var user = await data_metter.readData('SELECT user_our FROM Users');
      bool user_out = bool.parse(user[0]["user_our"].toString());
      if(user_out == true) {
        print('Log In State ${user[0]["user_our"]}');
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Navigetor_Pages()));
      }
    else
      {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));
    }
    // Navigator.pushReplacementNamed(context, '/login');
  }
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: On_Of_color,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Container(
              child: SvgPicture.asset(
                "assets/icons/wallet-minus.svg",
                width: 150,
                height: 150,
              ),
            ),
          )
        ],
      ),
    );
  }
}

