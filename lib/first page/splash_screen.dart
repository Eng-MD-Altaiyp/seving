import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seving/Models/Models_And_Classes/Colors.dart';
import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
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

  route() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
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
