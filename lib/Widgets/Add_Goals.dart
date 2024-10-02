import 'dart:convert';

// import 'package:business/Class.dart';
// import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:phlox_animations/phlox_animations.dart';

import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';
import '../Navigetor_Pages.dart';
import '../localization/app_localizations.dart';

class add_goals extends StatefulWidget {
  // final String type;

  const add_goals({
    Key? key,
  }) : super(key: key);

  @override
  State<add_goals> createState() => _add_goalsState();
}

class _add_goalsState extends State<add_goals> {
  Color colorcheck = Color(0xffffffff);
  Color colorcheck1 = Color(0xffffffff);
  final _formKey = GlobalKey<FormState>();

  // TextEditingController Customer_Name = TextEditingController();
  TextEditingController Goal_Name = TextEditingController();
  TextEditingController Goal_Price = TextEditingController();
  TextEditingController Goal_Monthly_Payment = TextEditingController();
  bool show_password = true;
  String date = "";
  String Type_Goal = "";

  Future Add_Goals(String date_start) async {
    try {
      double Price = double.parse(Goal_Price.text);
      double monthly_payment = double.parse(Goal_Monthly_Payment.text);
      var readData = await data_metter.readData("""
          SELECT * FROM 'goals'
      """);
      print('lllllllllllllllllllllllllllllllllllllllllll $readData');
      if (readData.isEmpty) {
        int insertD = await data_metter.insertData("""
      INSERT INTO 'goals' ('goal_name','goal_type','goal_price','monthly_payment','date_start','goal_Favorite','amount_paid')
      VALUES ('${Goal_Name.text}','${Type_Goal.toString()}','${Price.toDouble()}','${monthly_payment.toDouble()}','${date_start}','${0}','${0.0}')
      """);
        Navigator.of(context).pop();
        con("${AppLocalizations.of(context).Added}",
            "assets/icons/order-sent-successfully.svg", true);
        print("insert_d Off =================================== $insertD");

      } else if (readData.isNotEmpty) {
        bool exists = await checkIfItemExists(Price.toDouble(),
            monthly_payment.toDouble(), date_start.toString());

        if (exists != true) {
          int insertD = await data_metter.insertData("""
      INSERT INTO 'goals' ('goal_name','goal_type','goal_price','monthly_payment','date_start','goal_Favorite','amount_paid')
      VALUES ('${Goal_Name.text}','${Type_Goal.toString()}','${Price.toDouble()}','${monthly_payment.toDouble()}','${date_start}','${0}','${0.0}')
      """);
          print("insert_d Off =================================== $insertD");
          Navigator.of(context).pop();
          con("${AppLocalizations.of(context).Added}",
              "assets/icons/order-sent-successfully.svg", true);
        } else {
          con("${AppLocalizations.of(context).Exists}",
              "assets/icons/warning.svg", false);
        }
      }
    } catch (error) {
      con(error.toString(), "assets/icons/warning.svg", false);
      print(
          '==================================================================  $error');
    }
  }

  Future<bool> checkIfItemExists(
      double Price, double monthly_payment, String date_start) async {
    final List<Map<String, dynamic>> result = await data_metter.readData('''
     SELECT * FROM "goals" WHERE "goal_name" = "${Goal_Name.text}" AND "goal_price" = "${Price.toDouble()}" AND "goal_type" = "${Type_Goal.toString()}" ;
     ''');
    print('Empty Or Not Empty = ${result.isNotEmpty}');
    return result.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async
      {
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Navigetor_Pages()),
        );

      return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          flexibleSpace: Image.asset(
            'assets/images/app-bar-background-top.png',
            fit: BoxFit.fill,
          ),
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context).add_goals,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Montserrat-Regular',
            ),
          ),
          leading: Text(''),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Navigetor_Pages()),
                    );
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..scale(selectedLanguage == 'English' ? 1.0 : -1.0, 1.0),
                      child: SvgPicture.asset(
                        'assets/icons/arrow-right.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
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
                // color: Colors.red,
                child: ListView(
                  children: [
                    Image.asset("assets/images/app-bar-background-top.png"),
                    Image.asset("assets/images/app-bar-background.png"),
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
                            top: 100,
                            left: 20,
                            right: 20,
                            bottom: 10,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      colorcheck1 = Color(0xffffffff);
                                      Custoers();
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.only(left: 20, right: 20),
                                    height: 65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colorcheck1,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: SvgPicture.asset(
                                              "assets/icons/goal-svgrepo-com.svg",
                                              height: 30,
                                              width: 30,
                                              color: Blue_app,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 2, bottom: 8),
                                                  child: Type_Goal != ""
                                                      ? Text("")
                                                      : Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .choce_goal,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .grey.shade700,
                                                            fontFamily:
                                                                'Montserrat-Regular',
                                                          ),
                                                        ),
                                                ),
                                                Text(
                                                  "$Type_Goal",
                                                  style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black54),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: Blue_app,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
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
                                        return 'Please Enter Goal Name';
                                      }
                                      if (value.length < 4) {
                                        return 'Goal Name must be at least 4 characters';
                                      } else
                                        return null;
                                    },
                                    controller: Goal_Name,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          "  ${AppLocalizations.of(context).Text_Goal_Name} ",
                                      prefixIcon: Icon(
                                        Icons.work_history_rounded,
                                        color: Blue_app,
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
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
                                        return 'Please Enter Price';
                                      } else
                                        return null;
                                    },
                                    controller: Goal_Price,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            " ${AppLocalizations.of(context).Text_Goal_Price} ",
                                        prefixIcon: Icon(
                                          Icons.monetization_on,
                                          color: Blue_app,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
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
                                        return 'Please Enter Monthly payment';
                                      } else
                                        return null;
                                    },
                                    controller: Goal_Monthly_Payment,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            " ${AppLocalizations.of(context).Monthly_payment} ",
                                        prefixIcon: Icon(
                                          Icons.monetization_on,
                                          color: Blue_app,
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      colorcheck = Color(0xffffffff);
                                      showCupertinoModalPopup(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              width: double.infinity,
                                              height: ScreenHeight! / 2.39,
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 90,
                                                    height: 5,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Container(
                                                      height: ScreenHeight! / 2.5,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(20),
                                                          topRight:
                                                              Radius.circular(20),
                                                          // bottomLeft: Radius.circular(20),
                                                          // bottomRight: Radius.circular(20),
                                                        ),
                                                        border: Border(
                                                          top: BorderSide(
                                                            width: 5,
                                                            color: green_god,
                                                          ),
                                                          // bottom: BorderSide(width: 3, color: green_god,),
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            flex: 4,
                                                            child:
                                                                CupertinoDatePicker(
                                                              initialDateTime:
                                                                  Payment_Date,
                                                              mode:
                                                                  CupertinoDatePickerMode
                                                                      .monthYear,
                                                              onDateTimeChanged:
                                                                  (data) {
                                                                setState(() {
                                                                  Payment_Date =
                                                                      data;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 5,
                                                                      left: 20,
                                                                      right: 20),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsets
                                                                                .symmetric(
                                                                                vertical: 10,
                                                                                horizontal: 15),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap:
                                                                                  () {
                                                                                setState(() {
                                                                                  if (Payment_Date.month.toInt() < selectedDate.month.toInt() || Payment_Date.year.toInt() < selectedDate.year.toInt()) {
                                                                                    con(AppLocalizations.of(context).Date_Error, "assets/icons/warning.svg", false);
                                                                                  } else {
                                                                                    Payment_Date = Payment_Date;
                                                                                    Navigator.of(context).pop();
                                                                                  }
                                                                                });
                                                                              },
                                                                              child:
                                                                                  Container(
                                                                                width: 200,
                                                                                height: 50,
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    AppLocalizations.of(context).Ok_Date,
                                                                                    style: TextStyle(
                                                                                      fontSize: 16,
                                                                                      color: Colors.white,
                                                                                      fontFamily: 'Montserrat-Regular',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: green_god,
                                                                                  borderRadius: BorderRadius.circular(30),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsets
                                                                                .symmetric(
                                                                                vertical: 10,
                                                                                horizontal: 15),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap:
                                                                                  () {
                                                                                setState(() {
                                                                                  Payment_Date = selectedDate;
                                                                                  Navigator.of(context).pop();
                                                                                });
                                                                              },
                                                                              child:
                                                                                  Container(
                                                                                width: 200,
                                                                                height: 50,
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    AppLocalizations.of(context).Cancel,
                                                                                    style: TextStyle(
                                                                                      fontSize: 16,
                                                                                      color: Colors.grey.shade700,
                                                                                      fontFamily: 'Montserrat-Regular',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.grey.shade200,
                                                                                  borderRadius: BorderRadius.circular(30),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                alignment: lang ==
                                                                        'English'
                                                                    ? Alignment
                                                                        .centerLeft
                                                                    : Alignment
                                                                        .centerRight,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.only(left: 20, right: 20),
                                    height: 65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: colorcheck,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: SvgPicture.asset(
                                              "assets/icons/calendar.svg",
                                              height: 30,
                                              width: 30,
                                              color: Blue_app,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 8.0, bottom: 8),
                                                  child: date != ""
                                                      ? Text("")
                                                      : Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .Start_Date,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .grey.shade700,
                                                            fontFamily:
                                                                'Montserrat-Regular',
                                                          ),
                                                        ),
                                                ),
                                                Text(
                                                    "${Payment_Date.year} / ${Payment_Date.month}"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: Blue_app,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (Type_Goal != "") {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Confirm_saving();
                                    });
                                // Add_Goals();
                              }
                              // else{
                              //
                              // }
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            height: 54,
                            decoration: BoxDecoration(
                              // color: green_god,
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
                              AppLocalizations.of(context).add_goal_butom,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Montserrat-Regular',
                              ),
                            ),
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
      ),
    );
  }

  Widget Confirm_saving() {
    String date_start =
        Payment_Date.month.toString() + ' / ' + Payment_Date.year.toString();
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: ScreenHeight! / 1.3,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: PhloxAnimations(
                duration: const Duration(milliseconds: 300),
                fromOpacity: 0.1,
                fromY: -150,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(20),
                    //   topRight: Radius.circular(20),
                    //   bottomRight: Radius.circular(20),
                    //   bottomLeft: Radius.circular(20),
                    // ),
                    border: Border(
                      top: BorderSide(
                        width: 4,
                        color: green_god,
                      ),
                      bottom: BorderSide(
                        width: 4,
                        color: green_god,
                      ),
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            AppLocalizations.of(context).Confirm_saving,
                            style: TextStyle(
                                fontFamily: 'Cairo-VariableFont_slnt',
                                fontSize: ScreenWidth! / 27,
                                color: text100),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Container(
                          // height: 120,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .goal_type,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .Text_Goal_Name,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .Text_Goal_Price,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .Monthly_payment,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .Start_date,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            Type_Goal,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                1,
                                                1,
                                              ),
                                            ),
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                -1,
                                                -1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            Goal_Name.text,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                1,
                                                1,
                                              ),
                                            ),
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                -1,
                                                -1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            Goal_Price.text,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                1,
                                                1,
                                              ),
                                            ),
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                -1,
                                                -1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            Goal_Monthly_Payment.text,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                1,
                                                1,
                                              ),
                                            ),
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                -1,
                                                -1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            date_start,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey.shade700,
                                              fontFamily:
                                                  'Cairo-VariableFont_slnt',
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                1,
                                                1,
                                              ),
                                            ),
                                            BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              offset: const Offset(
                                                -1,
                                                -1,
                                              ),
                                            ),
                                          ],
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, left: 20),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Add_Goals(date_start);
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: green_god,
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context).Save,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenWidth! / 20,
                                            fontFamily:
                                                'Cairo-VariableFont_slnt'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 30),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context).Cancel,
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: ScreenWidth! / 20,
                                            fontFamily:
                                                'Cairo-VariableFont_slnt'),
                                      ),
                                    ),
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
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: PhloxAnimations(
                    duration: const Duration(milliseconds: 300),
                    fromOpacity: 0.1,
                    fromY: 150,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: SvgPicture.asset(
                        'assets/icons/close-circle.svg',
                        color: Colors.red.shade600,
                      ),
                    ),
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

  DateTime Payment_Date = DateTime.now();

  DateTime selectedDate = DateTime.now();

  //
  // Future _selectBerth(BuildContext context) async {
  //   final DateTime? selected = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2035),
  //     helpText: "SELECT BOOKING DATE",
  //     cancelText: "NOT NOW",
  //     confirmText: "BOOK NOW",
  //     fieldHintText: "DATE/MONTH/YEAR",
  //     fieldLabelText: "BOOKING DATE ",
  //     errorFormatText: "Enter a Valid Date",
  //     errorInvalidText: "Date Out of Range",
  //     initialDatePickerMode: DatePickerMode.day,
  //     initialEntryMode: DatePickerEntryMode.input,
  //   );
  //   if (selected != null && selected != selectedDate) {
  //     setState(() {
  //       selectedDate = selected;
  //       date = selectedDate.day.toString() +
  //           "-" +
  //           selectedDate.month.toString() +
  //           "-" +
  //           selectedDate.year.toString();
  //     });
  //   }
  // }

  Custoers() {
    showDialog(
      barrierDismissible: Type_Goal == "" ? false : true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          // shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          child: SizedBox(
            height: ScreenHeight! / 2.2,
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: PhloxAnimations(
                    duration: const Duration(milliseconds: 150),
                    fromOpacity: 0.1,
                    fromScale: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 9, right: 9),
                      child: Container(
                        width: double.infinity,
                        height: 230,
                        // color: background,
                        decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, right: 10, left: 10),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Type_Goal = 'Car';
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Align(
                                      alignment: lang == 'English'
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2, right: 2),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'assets/icons/service-type-6.svg',
                                                  // weight: 40,
                                                  width: 30,
                                                  color: On_Of_color,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Align(
                                              alignment: lang == 'English'
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .BuyCar,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.grey.shade700,
                                                    fontFamily:
                                                        'Cairo-VariableFont_slnt',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, right: 10, left: 10),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Type_Goal = 'Truck';
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Align(
                                      alignment: lang == 'English'
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2, right: 2),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'assets/icons/service-type-4.svg',
                                                  // weight: 40,
                                                  width: 30,
                                                  color: On_Of_color,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Align(
                                              alignment: lang == 'English'
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .BuyTruck,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.grey.shade700,
                                                    fontFamily:
                                                        'Cairo-VariableFont_slnt',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, right: 10, left: 10),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Type_Goal = 'Phone';
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Align(
                                      alignment: lang == 'English'
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2, right: 2),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'assets/icons/smartphone-2-svgrepo-com.svg',
                                                  // weight: 40,
                                                  width: 30,
                                                  color: On_Of_color,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Align(
                                              alignment: lang == 'English'
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .BuyPhone,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.grey.shade700,
                                                    fontFamily:
                                                        'Cairo-VariableFont_slnt',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, right: 10, left: 10),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Type_Goal = 'Motorbike';
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Align(
                                      alignment: lang == 'English'
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2, right: 2),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'assets/icons/motorbike-motorcycle-svgrepo-com.svg',
                                                  // weight: 40,
                                                  width: 30,
                                                  color: On_Of_color,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Align(
                                              alignment: lang == 'English'
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Text(
                                                  AppLocalizations.of(context)
                                                      .BuyMotorbike,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.grey.shade700,
                                                    fontFamily:
                                                        'Cairo-VariableFont_slnt',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: PhloxAnimations(
                        duration: const Duration(milliseconds: 300),
                        fromOpacity: 0.1,
                        fromY: 150,
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: SvgPicture.asset(
                            'assets/icons/close-circle.svg',
                            color: Colors.red.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
