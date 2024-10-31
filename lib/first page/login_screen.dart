import 'dart:async';
import 'dart:convert';

// import 'package:connectivity/connectivity.dart';
// import 'package:http/http.dart' as http;
// import 'package:business/Class.dart';
import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import '../HOME/home.dart';
import 'package:lottie/lottie.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:seving/first%20page/signup_screen.dart';

import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';
import '../Navigetor_Pages.dart';
import '../localization/app_localizations.dart';



class LoginScreen extends StatefulWidget {
  // final Function(Locale) setLocale;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool show_password = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController User_Name_Text = TextEditingController();
  TextEditingController Password = TextEditingController();
  int number = 0;
  var uname = "";
  var pass = "";
  bool Fingerprint = false;
  bool checkserver = false;

  userLogin() async {
      var user = await data_metter.readData('SELECT * FROM Users');
      if (user.isNotEmpty) {
        Map<String, dynamic> userData = user.first;
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
        // selectedLanguage = 'Arabic';

        // Repeat = true;
      }
   if(User_Names == User_Name_Text.text && Passs == Password.text)
     {
       int Open_Session =await Open_Session_Method();
      if(Open_Session > 0)
        {
          Future.delayed(Duration(seconds: 2), () {
            checkserver = true;
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Navigetor_Pages()));
          });
        }
      else
        con("${AppLocalizations.of(context).Error_In_Session}",
            "assets/icons/warning.svg", false);
     }
   else
     {
       con("${AppLocalizations.of(context).Exists}",
           "assets/icons/warning.svg", false);
     }

  }

  void initState() {
    super.initState();
  }

  Loading() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        Timer(
          Duration(seconds: 10),
              () {
            if (checkserver == false)
              con("Verify That The Server is Running   (Error 504)","assets/icons/info-circle.svg",false);
          },
        );
        userLogin();
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white54,
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        )
                      ],
                  ),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.white54,
                    color: Color.fromARGB(255, 250, 141, 17),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future Fingers() async {}

  ShowFingers() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        Fingers();
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 160,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              color: color1,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    color: color1,
                    child: Column(
                      children: <Widget>[
                        Container(height: 10),
                        Image.asset("assets/images/Finger.png"),
                        Container(height: 10),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Password",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        flexibleSpace: Image.asset(
          'assets/images/app-bar-background-top.png',
          fit: BoxFit.fill,
        ),
        // backgroundColor: Color.fromARGB(255, 246, 246, 246),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/app-bar-background-top.png"),
                          fit: BoxFit.fill,
                        )),
                    height: 125,
                  ),
                  Image.asset(
                    "assets/images/app-bar-background-bottom.png",
                  ),
                  // PhloxAnimations(
                  //     duration: Duration(milliseconds: animation == true ? 2000 : 200),
                  //     fromOpacity: 0.1,
                  //     fromY: -50,
                  //     child: Image.asset(
                  //       "assets/images/app-bar-background-top.png",
                  //     )), PhloxAnimations(
                  //     duration: Duration(milliseconds: animation == true ? 2000 : 200),
                  //     fromOpacity: 0.1,
                  //     fromY: -50,
                  //     child: Image.asset(
                  //       "assets/images/app-bar-background-bottom.png",
                  //     )),
                ],
              ),
            ),
            Positioned(
              //top: 20,left: 10,right: 10,bottom: 10,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                //color: Colors.blue,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 140,
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              PhloxAnimations(
                                duration: Duration(
                                    milliseconds:
                                    animation == true ? 1200 : 200),
                                fromOpacity: 0.1,
                                fromX: -50,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffffffff),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter User Name';
                                      }
                                      if (value.length < 4) {
                                        return 'User Name must be at least 4 characters';
                                      } else
                                        return null;
                                    },
                                    controller: User_Name_Text,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "  User Name ",
                                        prefixIcon: Icon(
                                          Icons.account_circle,
                                          color: Color(0xff1e3580),
                                        ),
                                        hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                              ),
                              PhloxAnimations(
                                duration: Duration(
                                    milliseconds:
                                    animation == true ? 1200 : 200),
                                fromOpacity: 0.1,
                                fromX: 50,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffffffff),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Password';
                                      }
                                      if (value.length < 4) {
                                        return 'Password must be at least 4 characters';
                                      } else
                                        return null;
                                    },
                                    controller: Password,
                                    obscureText: show_password,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "  Password ",
                                      prefixIcon: Icon(
                                        Icons.key,
                                        color: Color(0xff1e3580),
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              show_password = !show_password;
                                            });
                                          },
                                          icon: show_password == true
                                              ? Icon(
                                            Icons.remove_red_eye,
                                            color: Color(0xff1e3580),
                                          )
                                              : Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          )),
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      PhloxAnimations(
                        duration: Duration(
                            milliseconds: animation == true ? 2000 : 200),
                        fromOpacity: 0.1,
                        fromX: -50,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40, bottom: 30),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: ()
                              {
                                
                              },
                              child: Text(
                                AppLocalizations.of(context).User_Name,
                                style: const TextStyle(
                                    fontFamily: 'Cairo-VariableFont_slnt',
                                    //fontSize: ScreenWidth!/30,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      PhloxAnimations(
                        duration: Duration(
                            milliseconds: animation == true ? 2000 : 200),
                        fromOpacity: 0.1,
                        fromY: 50,
                        child: GestureDetector(
                          onTap: () {
                            setState(() async {
                              if (_formKey.currentState!.validate()) {
                                Loading();
                              } else {
                                con("Check The Input",
                                    "assets/icons/warning.svg", false);
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 50,
                            ),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            height: 54,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/app-bar-background-top.png"),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5, 5),
                                  blurRadius: 15,
                                  color: Colors.grey.shade300,
                                ),
                                BoxShadow(
                                    offset: Offset(-5, -5),
                                    blurRadius: 15,
                                    color: Colors.grey.shade300),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      // PhloxAnimations(
                      //   duration: Duration(
                      //       milliseconds: animation == true ? 2200 : 200),
                      //   fromOpacity: 0.1,
                      //   fromY: 50,
                      //   child: Container(
                      //     padding: EdgeInsets.only(bottom: 90),
                      //     margin: EdgeInsets.only(top: 10),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text("You don't have an Accont on the Platform "),
                      //         GestureDetector(
                      //           child: Text(
                      //             "LOGIN",
                      //             style: TextStyle(color: Color(0xff1e3580)),
                      //           ),
                      //           onTap: () {
                      //             // Write Tap Code Here.
                      //             Navigator.of(context).pushReplacement(
                      //                 MaterialPageRoute(
                      //                     builder: (context) =>
                      //                         SignUpScreen()));
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  con(var masg, var icon, bool color) {
    InAppNotification.show(
      duration: Duration(seconds: 3),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            // color: color,
              gradient: LinearGradient(
                begin: lang == 'English'
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                end: lang == 'English'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
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
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                    child: SvgPicture.asset(
                      "$icon",
                      height: 40,
                      width: 40,
                    )),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: lang == 'English'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    "$masg",
                    style: TextStyle(
                      color: Colors.white,
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

  Future<int> Open_Session_Method() async{
    int update = await data_metter.updateData("""
      UPDATE  'Users' SET
       'user_our' = "true"
        WHERE user_id = ${User_ID.toInt()}
      """);
    if(update > 0) {
      print('Log In State False');
      print('updated Ofline ===========    =========== $update');
    }
    else
      print('Log In State True');
    return update;
  }
}

