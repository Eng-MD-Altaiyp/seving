import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:http/http.dart' as http;
import 'package:in_app_notification/in_app_notification.dart';
import 'package:lottie/lottie.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:seving/Widgets/Add_Goals.dart';
import 'package:seving/localization/app_localizations.dart';
import 'EndDrawers.dart';

// import 'Models/Future_Function/Future_Functions.dart';
// import 'Models/Models_And_Classes/Classes _and_barameters.dart';
// import 'Models/Models_And_Classes/Colors.dart';
import 'Models/Models_And_Classes/Classes _and_barameters.dart';
import 'Models/Models_And_Classes/Colors.dart';
import 'Screens/Favorite_List.dart';
import 'Screens/Home_Screen.dart';
import 'Screens/List_Screen.dart';
import 'Screens/Notifications_Screen.dart';
import 'Screens/User_Account.dart';
// import 'Test_Response_Data.dart';

class Navigetor_Pages extends StatefulWidget {
  const Navigetor_Pages({super.key});

  @override
  State<Navigetor_Pages> createState() => _Navigetor_PagesState();
}

class _Navigetor_PagesState extends State<Navigetor_Pages>
    with TickerProviderStateMixin {
  bool home = false;
  bool list = false;
  bool favorite = false;
  bool user = false;

  List<Builder> pages = [

    Builder(builder: (context) {
      return const User_Account();
    }),
    Builder(builder: (context) {
      return const Favorite_List();
    }),
    Builder(builder: (context) {
      return const List_Screen();
    }),
    Builder(builder: (context) {
      return const Home_Screen();
    }),
  ];

/////////////////
  // لتغير حالة ال Animations

  var _Check_Server;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _Check_Server =
          Stream.periodic(const Duration(seconds: 2)).listen((event) {
        // Get_data();
      });
      startTime();
    });
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, cheng);
  }

  cheng() {
    animation = false;
  }

  ///////////////////

  double? Consumption_Calculation;
  double? T_Previous_Reading;

  @override
  void dispose() {
    _Check_Server.cancel();
    super.dispose();
  }

  DateTime timeBack = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBack);
        final isExitWarning = difference >= const Duration(seconds: 2);
        timeBack = DateTime.now();
        if (isExitWarning) {
          const message = "               اضغط مرة أخرى للخروج               ";
          Fluttertoast.showToast(
            msg: message,
            fontSize: 18,
            backgroundColor: Orange,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          title: PhloxAnimations(
            duration: Duration(milliseconds: animation == true ? 1200 : 200),
            fromOpacity: 0.1,
            fromX: 50,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/5-on-review.svg',
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        AppLocalizations.of(context).User_Name,
                        style: const TextStyle(
                            fontFamily: 'Cairo-VariableFont_slnt',
                            //fontSize: ScreenWidth!/30,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //centerTitle: true,
          flexibleSpace: Image.asset(
            'assets/images/app-bar-background-top.png',
            fit: BoxFit.fill,
          ),
          actions: [
            LayoutBuilder(builder: (context, sizes) {
              // double w1 = sizes.maxWidth;
              double h1 = sizes.maxHeight;
              return PhloxAnimations(
                duration: Duration(milliseconds: animation == true ? 1200 : 0),
                fromOpacity: 0.1,
                fromX: 50,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 2,
                        bottom: 2,
                        right: 13,
                        left: 13,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                const Notifications_Screen()));
                          });
                        },
                        child: Container(
                          width: 50,
                          height: h1 / 1.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/icons/notification.svg',
                              color: Blue_app,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 19,
                      top: 7,
                      child: Container(
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                            color: Orange,
                            borderRadius:
                            BorderRadius.circular(ScreenWidth! / 45),
                            border: Border.all(
                              width: 1.4,
                              color: Colors.white,
                            )),
                        child: Center(
                          child: Text(
                            '$Counter_Notifications',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontFamily: 'Montserrat-Regular',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
          leading:   PhloxAnimations(
            duration: Duration(milliseconds: animation == true ? 1200 : 0),
            fromOpacity: 0.1,
            fromX: 50,
            child: Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 7,
                  left: 7
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      Scaffold.of(context).openDrawer();
                    });
                  },
                  child: Container(
                    width: ScreenWidth! / 9,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        'assets/icons/user.svg',
                        color: primary100,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // backgroundColor: accent200,
        ),
        drawer:  EndDrawers(),

        // طريقة عمله نعرف متغير يحتوي على مجموع عدد الصفحات = 3 يبدا من 0 ومن ثم يستدعى على حسب رقم الصفحة في المصفوفه
        body: pages[IndexPage],

        extendBody: true,
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: IndexPage == 3
            ? PhloxAnimations(
                duration: Duration(milliseconds: animation == true ? 1000 : 400),
                fromOpacity: 0.1,
                fromY: 50,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => add_goals()),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/add-circle.svg",
                    width: 30,
                    height: 30,
                    color: Orange,
                  ),
                ),
              )
            : null,
        bottomNavigationBar: SafeArea(
          child: PhloxAnimations(
            duration: Duration(milliseconds: animation == true ? 1800 : 0),
            fromOpacity: 0.1,
            fromY: 50,
            child: Container(
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 4,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: navegitor == 'home'
                                      ? Orange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 4,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: navegitor == 'list'
                                      ? Orange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 4,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: navegitor == 'favorite'
                                      ? Orange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 4,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: navegitor == 'user'
                                      ? Orange
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 1, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (IndexPage == 3) {
                                    home = false;
                                  } else {
                                    home = true;
                                  }

                                  Future.delayed(
                                    const Duration(milliseconds: 1200),
                                        () {
                                      setState(() {
                                        home = false;
                                      });
                                    },
                                  );

                                  // هذا المتغير يقوم التحكم بلون ايقونة الصفحة المفتوحة
                                  navegitor = 'home';
                                  // ينقل للصفحة رقم 1 في المصفوفة صفحة الاشعارات
                                  IndexPage = 3;
                                });
                              },
                              child: home == true
                                  ? Lottie.asset('assets/animations/home.json',
                                  width: 39, height: 39)
                                  : SvgPicture.asset(
                                navegitor == 'home'
                                    ? 'assets/Nav-Img/Home-1-Foucs.svg'
                                    : 'assets/Nav-Img/Home-2.svg',
                                // color: navegitor != 'user' ? primary100 : accent100,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 0, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (IndexPage == 2) {
                                    list = false;
                                  } else {
                                    list = true;
                                  }

                                  Future.delayed(
                                    const Duration(milliseconds: 1200),
                                        () {
                                      setState(() {
                                        list = false;
                                      });
                                    },
                                  );

                                  // هذا المتغير يقوم التحكم بلون ايقونة الصفحة المفتوحة
                                  navegitor = 'list';
                                  // ينقل للصفحة رقم 1 في المصفوفة صفحة الاشعارات
                                  IndexPage = 2;
                                });
                              },
                              child: list == true
                                  ? Lottie.asset('assets/animations/orders.json',
                                  width: 39, height: 39):SvgPicture.asset(
                                navegitor == 'list'
                                    ? 'assets/Nav-Img/List-1-Foucs.svg'
                                    : 'assets/Nav-Img/List-2.svg',
                                // color: navegitor != 'timer' ? primary100 : accent100,
                                // width: 30,
                                // height: 30,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 1, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (IndexPage == 1) {
                                    favorite = false;
                                  } else {
                                    favorite = true;
                                  }

                                  Future.delayed(
                                    const Duration(milliseconds: 1200),
                                        () {
                                      setState(() {
                                        favorite = false;
                                      });
                                    },
                                  );

                                  // هذا المتغير يقوم التحكم بلون ايقونة الصفحة المفتوحة
                                  navegitor = 'favorite';
                                  // ينقل للصفحة رقم 1 في المصفوفة صفحة الاشعارات
                                  IndexPage = 1;
                                });
                              },
                              child: favorite == true
                                  ? Lottie.asset('assets/animations/favorites.json',
                                  width: 39, height: 39):SvgPicture.asset(
                                navegitor == 'favorite'
                                    ? 'assets/Nav-Img/Favorite-1-Foucs.svg'
                                    : 'assets/Nav-Img/Favorite-2.svg',
                                // color: navegitor != 'list' ? primary100 : accent100,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 1, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (IndexPage == 0) {
                                    user = false;
                                  } else {
                                    user = true;
                                  }

                                  Future.delayed(
                                    const Duration(milliseconds: 1200),
                                        () {
                                      setState(() {
                                        user = false;
                                      });
                                    },
                                  );

                                  // هذا المتغير يقوم التحكم بلون ايقونة الصفحة المفتوحة
                                  navegitor = 'user';
                                  // ينقل للصفحة رقم 1 في المصفوفة صفحة الاشعارات

                                  IndexPage = 0;
                                });
                              },
                              child: user == true
                                  ? Lottie.asset('assets/animations/profile.json',
                                  width: 39, height: 39):SvgPicture.asset(
                                navegitor == 'user'
                                    ? 'assets/Nav-Img/User-1-Foucs.svg'
                                    : 'assets/Nav-Img/User-2.svg',
                                // color: navegitor != 'home' ? primary100 : accent100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Connaction_Notification(var masg, var icon, bool color) {
    InAppNotification.show(
      duration: const Duration(seconds: 4),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  color == true
                      ? const Color(0xD87CE892)
                      : const Color(0xffCFACAD),
                  color == true
                      ? const Color(0xB268D87F)
                      : const Color(0xffB78285),
                  color == true
                      ? const Color(0x968BDC9C)
                      : const Color(0xff9F595C),
                ],
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                    child: SvgPicture.asset(
                  "$icon",
                  color: color == true ? null : const Color(0xff9F595C),
                  height: 40,
                  width: 40,
                )),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    "$masg",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      context: context,
      onTap: () => print('Notification tapped!'),
    );
  }
}
