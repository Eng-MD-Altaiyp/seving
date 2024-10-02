import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seving/localization/app_localizations.dart';

import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';
import 'Home-Widgets/Search_Bar.dart';
import 'Home-Widgets/Tasks.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWidth,
      color: background,
      child: ListView(
        children:  [
          Tasks(),
          Search_Bar(),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
                  child: InkWell(
                    onTap: () {
                      // setState(() async {
                      //   var result = await Connectivity().checkConnectivity();
                      //   if (result == ConnectivityResult.wifi ||
                      //       result == ConnectivityResult.mobile) {
                      //     Navigator.of(context).push(
                      //         MaterialPageRoute(builder: (context) => Examing()));
                      //   } else {
                      //     con("No Intarnet Connection",
                      //         "assets/icons/error-connection.svg");
                      //   }
                      // });
                    },
                    child: Container(
                      width: 170,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 55,
                                    left: 59,
                                    child: Text(
                                      AppLocalizations.of(context).BuyTruck,
                                      style: TextStyle(color: color3p),
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 45,
                                    child: SvgPicture.asset(
                                      'assets/icons/service-type-4.svg',
                                      width: 80,
                                      height: 80,
                                      color: color3p,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(AppLocalizations.of(context).BuyTruck, textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                  child: InkWell(
                    onTap: () {
                      // setState(() async {
                      //   var result = await Connectivity().checkConnectivity();
                      //   if (result == ConnectivityResult.wifi ||
                      //       result == ConnectivityResult.mobile) {
                      //     Navigator.of(context).push(
                      //         MaterialPageRoute(builder: (context) => Testing()));
                      //   } else {
                      //     con("No Intarnet Connection",
                      //         "assets/icons/error-connection.svg");
                      //   }
                      // });
                    },
                    child: Container(
                      width: 170,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 55,
                                    left: 59,
                                    child: Text(
                                      AppLocalizations.of(context).BuyCar,
                                      style: TextStyle(color: color3p),
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 45,
                                    child: SvgPicture.asset(
                                      'assets/icons/service-type-6.svg',
                                      width: 80,
                                      height: 80,
                                      color: color3p,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(AppLocalizations.of(context).BuyCar, textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
                  child: InkWell(
                    onTap: () {
                      // setState(() async {
                      //   var result = await Connectivity().checkConnectivity();
                      //   if (result == ConnectivityResult.wifi ||
                      //       result == ConnectivityResult.mobile) {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => Projects()));
                      //   } else {
                      //     con("No Intarnet Connection",
                      //         "assets/icons/error-connection.svg");
                      //   }
                      // });
                    },
                    child: Container(
                      width: 170,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: SvgPicture.asset(
                                'assets/icons/motorbike-motorcycle-svgrepo-com.svg',
                                width: 80,
                                height: 80,
                                color: color3p,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child:
                              Text(AppLocalizations.of(context).BuyMotorbike, textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                  child: InkWell(
                    onTap: () {
                      // setState(() async {
                      //   var result = await Connectivity().checkConnectivity();
                      //   if (result == ConnectivityResult.wifi ||
                      //       result == ConnectivityResult.mobile) {
                      //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Quizs()));
                      //   } else {
                      //     con("No Intarnet Connection",
                      //         "assets/icons/error-connection.svg");
                      //   }
                      // });
                    },
                    child: Container(
                      width: 170,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 55,
                                    left: 59,
                                    child: Text(
                                        AppLocalizations.of(context).BuyPhone,
                                      style: TextStyle(color: color3p),
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 45,
                                    child: SvgPicture.asset(
                                      'assets/icons/smartphone-2-svgrepo-com.svg',
                                      width: 80,
                                      height: 80,
                                      color: color3p,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(AppLocalizations.of(context).BuyPhone, textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }
}
