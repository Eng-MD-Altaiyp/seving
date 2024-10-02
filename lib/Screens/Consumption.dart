/*
import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:smart_meter/Models/Models_And_Classes/Classes%20_and_barameters.dart';
import 'package:smart_meter/Models/Models_And_Classes/Colors.dart';
import 'package:http/http.dart' as http;

var List_Response;
int Index_Day = 0;
int Countter_Statistics_Length = 0;

class Consumption_Screen extends StatefulWidget {
  const Consumption_Screen({super.key});

  @override
  State<Consumption_Screen> createState() => _Consumption_ScreenState();
}

class _Consumption_ScreenState extends State<Consumption_Screen>
    with TickerProviderStateMixin {
  bool test = false;

  // AnimationController? _controller;

  Future<void> _handleRefresh() async {
    return Future.delayed(
      Duration(seconds: 2),
      GetAllResponse_Statistics(),
    );
  }

  var Response_Statistics;

  GetAllResponse_Statistics() async {
    var url = "http://$DeviceIpAddress:$Port/api/GetStatisticsConsumption";
    var data = {
      "Choice": 2,
      "Day": 1,
      "Month": Month_now,
      "Year": Year_now,
    };
    var response = await http.post(Uri.parse(url), body: json.encode(data));
    if (response.statusCode == 200) {
      Response_Statistics = json.decode(response.body);
      List_Response = json.decode(response.body);
      Countter_Statistics_Length = List_Response.length;

      if(Countter_Statistics_Length==28)
        Temp_Index=Day_28;
      else if(Countter_Statistics_Length==29)
        Temp_Index=Day_29;
      else if(Countter_Statistics_Length==30)
        Temp_Index=Day_30;
      else if(Countter_Statistics_Length==31)
        Temp_Index=Day_31;

      print("Response_Statistics    ::::    ${Response_Statistics}");
      print(
          "Countter_Statistics_Length    ::::    ${Countter_Statistics_Length}");
      //alldata=[response.body];
      return json.decode(response.body);
    } else
      print(
          "sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    return json.decode(response.body);
  }

  int generateRandomNumber(int min, int max) {
    final random = Random();
    int w = max - min + 1;
    int S = min + random.nextInt(w);
    return S;
  }

  int main() {
    // Example usage:
    int randomNumber = generateRandomNumber(100, 5000);
    return randomNumber;
  }

  @override
  void initState() {
    super.initState();
    Day_now = selectedDate.day;
    Month_now = selectedDate.month;
    Year_now = selectedDate.year;
    Now_Houres = selectedDate.hour;
    GetAllResponse_Statistics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text(
          'الإستهلاك',
          style: TextStyle(
            fontSize: ScreenHeight! / 30,
            fontFamily: 'Montserrat-Bold',
            color: Colors.white,
          ),
        ),
        elevation: 0,
        flexibleSpace: Image.asset(
          'assets/images/app-bar-background-top.png',
          fit: BoxFit.fill,
        ),
        leading: Text(''),
        actions: [
          PhloxAnimations(
            duration: Duration(milliseconds: 400),
            fromOpacity: 0.1,
            fromX: 50,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
                right: 15,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                child: Container(
                  width: ScreenWidth! / 9,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-right.svg',
                      color: primary100,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: ScreenWidth,
        height: ScreenHeight,
        color: background,
        child: Column(
          children: [
            Container(
              width: ScreenWidth,
              height: ScreenHeight! / 10,
              decoration: BoxDecoration(
                //color: accent200,
                image: DecorationImage(
                  image:
                  AssetImage('assets/images/app-bar-background-bottom.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Container(
                height: ScreenHeight! / 3,
                width: ScreenWidth,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: background,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.only(top: 3),
                        child: Container(
                          height: ScreenHeight! / 18,
                          width: ScreenWidth,
                          decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: background,
                                offset: Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Container(
                            //color: Colors.deepPurple,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Day
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, right: 15, left: 15, bottom: 6),
                                    child: InkWell(
                                      onTap: () {
                                        ////// Day
                                        setState(() {
                                          IndexPlan = 0;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: IndexPlan != 0
                                              ? Colors.white
                                              : Blue_app_op,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade500,
                                              offset: Offset(4, 4),
                                              blurRadius: 15,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'يوم',
                                            style: TextStyle(
                                              fontSize: ScreenWidth! / 27,
                                              fontFamily:
                                              'Cairo-VariableFont_slnt',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Day

                                //Month
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, right: 15, left: 15, bottom: 6),
                                    child: InkWell(
                                      onTap: () {
                                        ////// month
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                backgroundColor:
                                                Colors.transparent,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                                child: Container(
                                                  height: ScreenHeight! / 2,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(),
                                                      ),
                                                      Expanded(
                                                        flex: 7,
                                                        child: Container(
                                                          width: 80,
                                                          padding:
                                                          EdgeInsets.all(
                                                              15),
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4),
                                                          ),
                                                          child: ListView(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    1;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'يناير')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    2;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'فبراير')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    3;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'مارس')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    4;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'أبريل')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    5;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'مايو')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    6;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'يونيو')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    7;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'يوليو')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    8;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'أغسطس')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    9;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'سبتمبر')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    10;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'أكتوبر')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    11;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'نوفمبر')),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    Month_now =
                                                                    12;
                                                                    IndexPlan =
                                                                    1;
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  });
                                                                },
                                                                child: Center(
                                                                    child: Text(
                                                                        'ديسمبر')),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Align(
                                                          alignment:
                                                          Alignment.center,
                                                          child: InkWell(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                50),
                                                            onTap: () {
                                                              Navigator.of(
                                                                  context)
                                                                  .pop();
                                                            },
                                                            child:
                                                            PhloxAnimations(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                  300),
                                                              fromOpacity: 0.1,
                                                              fromY: 150,
                                                              child: Container(
                                                                width: 60,
                                                                height: 60,
                                                                child:
                                                                SvgPicture
                                                                    .asset(
                                                                  'assets/icons/close-circle.svg',
                                                                  color:
                                                                  primary300,
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
                                            });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: IndexPlan != 1
                                              ? Colors.white
                                              : Blue_app_op,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade500,
                                              offset: Offset(4, 4),
                                              blurRadius: 15,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'شهر',
                                            style: TextStyle(
                                              fontSize: ScreenWidth! / 27,
                                              fontFamily:
                                              'Cairo-VariableFont_slnt',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Month_now

                                //Year
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, right: 15, left: 15, bottom: 6),
                                    child: InkWell(
                                      onTap: () {
                                        ////// year
                                        setState(() {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  backgroundColor:
                                                  Colors.transparent,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                  ),
                                                  child: Container(
                                                    height: ScreenHeight! / 4,
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            width: 80,
                                                            padding:
                                                            EdgeInsets.all(
                                                                15),
                                                            decoration:
                                                            BoxDecoration(
                                                              color:
                                                              Colors.white,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  4),
                                                            ),
                                                            child: ListView(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                            () {
                                                                          Year_now =
                                                                          2023;
                                                                          IndexPlan =
                                                                          2;
                                                                          Navigator.of(
                                                                              context)
                                                                              .pop();
                                                                        });
                                                                  },
                                                                  child: Center(
                                                                      child: Text(
                                                                          '2023')),
                                                                ),
                                                                SizedBox(
                                                                  height: 20,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                            () {
                                                                          Year_now =
                                                                          2024;
                                                                          IndexPlan =
                                                                          2;
                                                                          Navigator.of(
                                                                              context)
                                                                              .pop();
                                                                        });
                                                                  },
                                                                  child: Center(
                                                                      child: Text(
                                                                          '2024')),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: InkWell(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  50),
                                                              onTap: () {
                                                                Navigator.of(
                                                                    context)
                                                                    .pop();
                                                              },
                                                              child:
                                                              PhloxAnimations(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                    300),
                                                                fromOpacity:
                                                                0.1,
                                                                fromY: 150,
                                                                child:
                                                                Container(
                                                                  width: 60,
                                                                  height: 60,
                                                                  child:
                                                                  SvgPicture
                                                                      .asset(
                                                                    'assets/icons/close-circle.svg',
                                                                    color:
                                                                    primary300,
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
                                              });
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: IndexPlan != 2
                                              ? Colors.white
                                              : Blue_app_op,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade500,
                                              offset: Offset(4, 4),
                                              blurRadius: 15,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            'سنة',
                                            style: TextStyle(
                                              fontSize: ScreenWidth! / 27,
                                              fontFamily:
                                              'Cairo-VariableFont_slnt',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Year
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 12,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 4, right: 4, bottom: 0, top: 10),
                        padding: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(2, 2),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-2, -2),
                                      blurRadius: 15,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                //color: Colors.red,
                                child: Column(
                                  children: [
                                    // SizedBox(height: 5,),
                                    // Container(
                                    //   child: Text(
                                    //     '${Month_now} / ${Year_now}',
                                    //     style: TextStyle(
                                    //       fontSize: ScreenWidth! / 32,
                                    //       fontFamily:
                                    //       'Cairo-VariableFont_slnt',
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.black,
                                    //     ),
                                    //   ),),

                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('   5  K--'),
                                    ),
                                    Text('--'),
                                    Text('--'),
                                    Text('--'),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('   3  K--'),
                                    ),
                                    Text('--'),
                                    Text('--'),
                                    Text('--'),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('   1.5K--'),
                                    ),
                                    Text('--'),
                                    Text('--'),
                                    Text('Day ->'),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 11,
                              child: LayoutBuilder(builder: (context, sizes) {
                                double w1 = sizes.maxWidth;
                                // double h1 = sizes.maxHeight;
                                width = w1;
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5, bottom: 4),
                                  child: Container(
                                    //color: Colors.green,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: Container(
                                            //color: Colors.red,
                                            child: FutureBuilder(
                                              future:
                                              GetAllResponse_Statistics(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  print('The Data is Correct');
                                                } else {
                                                  GetAllResponse_Statistics();
                                                }

                                                return snapshot.hasData
                                                    ? ListView.builder(
                                                  //controller: _controller,
                                                  scrollDirection:
                                                  Axis.horizontal,
                                                  itemCount:
                                                  IndexPlan != 0
                                                      ? Temp_Index.length
                                                      : Houre_List.length,
                                                  itemBuilder:
                                                      (context, i) {
                                                    ////////
                                                    // int Random_Value = main();
                                                    /////////
                                                    if(Countter_Statistics_Length==28)
                                                      Temp_Index=Day_28;
                                                    else if(Countter_Statistics_Length==29)
                                                      Temp_Index=Day_29;
                                                    else if(Countter_Statistics_Length==30)
                                                      Temp_Index=Day_30;
                                                    else if(Countter_Statistics_Length==31)
                                                      Temp_Index=Day_31;

                                                    Index_Day = i;
                                                    int value = int.parse(
                                                        '${Response_Statistics["${Temp_Index[i].toString()}"]}');

                                                    Edite_Top(
                                                        value);

                                                    return Initiation_Charts();
                                                  },
                                                )
                                                    : Center(
                                                    child: Lottie.asset(
                                                      "assets/animations/not-found.json",
                                                      width: 150,
                                                      height: 150,
                                                    ));
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: ScreenWidth,
                child: LiquidPullToRefresh(
                  backgroundColor: Orange,
                  color: Blue_app,
                  height: ScreenHeight! / 15,
                  borderWidth: 0.7,
                  onRefresh: _handleRefresh,
                  // refresh callback
                  child: PhloxAnimations(
                    duration: Duration(milliseconds: 200),
                    fromOpacity: 0.1,
                    fromX: 50,
                    child: FutureBuilder(
                      future: GetAllResponse_Statistics(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? Notification_Consumpions()
                            : Center(
                            child: Lottie.asset(
                              "assets/animations/not-found.json",
                              width: 150,
                              height: 150,
                            ));
                      },
                    ),
                  ),
                ),
              ),
              //Search_Bar(),
              //Services(),
            ),
          ],
        ),
      ),
    );
  }

  double Edite_Top(int value) {
    //value <= 7964.335 ?top=3:top=225;

    double plus = 20;

    if (value <= 161) {
      top = 150 + plus;
    } else if (value <= 161 * 2) {
      top = 145 + plus;
    } else if (value <= 161 * 3) {
      top = 140 + plus;
    } else if (value <= 161 * 4) {
      top = 135 + plus;
    } else if (value <= 161 * 5) {
      top = 130 + plus;
    } else if (value <= 161 * 6) {
      top = 125 + plus;
    } else if (value <= 161 * 7) {
      top = 120 + plus;
    } else if (value <= 161 * 8) {
      top = 115 + plus;
    } else if (value <= 161 * 9) {
      top = 110 + plus;
    } else if (value <= 161 * 10) {
      top = 105 + plus;
    } else if (value <= 161 * 11) {
      top = 100 + plus;
    } else if (value <= 161 * 12) {
      top = 95 + plus;
    } else if (value <= 161 * 13) {
      top = 90 + plus;
    } else if (value <= 161 * 14) {
      top = 85 + plus;
    } else if (value <= 161 * 15) {
      top = 80 + plus;
    } else if (value <= 161 * 16) {
      top = 75 + plus;
    } else if (value <= 161 * 17) {
      top = 70 + plus;
    } else if (value <= 161 * 18) {
      top = 65 + plus;
    } else if (value <= 161 * 19) {
      top = 60 + plus;
    } else if (value <= 161 * 20) {
      top = 55 + plus;
    } else if (value <= 161 * 21) {
      top = 50 + plus;
    } else if (value <= 161 * 22) {
      top = 45 + plus;
    } else if (value <= 161 * 23) {
      top = 40 + plus;
    } else if (value <= 161 * 24) {
      top = 35 + plus;
    } else if (value <= 161 * 25) {
      top = 30 + plus;
    } else if (value <= 161 * 26) {
      top = 25 + plus;
    } else if (value <= 161 * 27) {
      top = 20 + plus;
    } else if (value <= 161 * 28) {
      top = 15 + plus;
    } else if (value <= 161 * 29) {
      top = 10 + plus;
    } else if (value <= 161 * 30) {
      top = 5 + plus;
    } else if (value <= 161 * 31) {
      top = 1 + plus;
    }

    return top;
  }
}

class Initiation_Charts extends StatelessWidget {
  const Initiation_Charts({super.key});

  //double value = double.parse("1000");

  @override
  Widget build(BuildContext context) {
    double Top = top.toDouble();
    double Top_Sahadow = 10;
    Top = Top - 10;
    return Padding(
      padding: EdgeInsets.only(left: 6, right: 6, top: Top_Sahadow),
      child: Container(
        decoration: BoxDecoration(
          color: text200 = Color(0x52868686),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: Top),
          child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 20,
                height: 18,
                decoration: BoxDecoration(
                  color: Orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '${Temp_Index[Index_Day]}',
                    style: TextStyle(
                      fontSize: ScreenWidth! / 35,
                      fontFamily: 'Cairo-VariableFont_slnt',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            width: width! / 20,
            decoration: BoxDecoration(
              color: Blue_app,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Notification_Consumpions extends StatefulWidget {
  const Notification_Consumpions({super.key});

  @override
  State<Notification_Consumpions> createState() =>
      _Notification_ConsumpionsState();
}

class _Notification_ConsumpionsState extends State<Notification_Consumpions> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Temp_Index.length,
      itemBuilder: (context, i) {
        return List_Response["${Temp_Index[i]}"] >= MaxConsumption
            ? Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
            bottom: 5,
          ),
          child: Container(
            width: ScreenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8,
                bottom: 10,
              ),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: ' من ',
                                  style: TextStyle(
                                    fontSize: ScreenHeight! / 65,
                                    fontFamily: 'Cairo-VariableFont_slnt',
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                  ' ${selectedDate.minute} : ${selectedDate.hour} ',
                                  style: TextStyle(
                                    fontSize: ScreenHeight! / 65,
                                    fontFamily: 'Cairo-VariableFont_slnt',
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: ' الى ',
                                  style: TextStyle(
                                    fontSize: ScreenHeight! / 65,
                                    fontFamily: 'Cairo-VariableFont_slnt',
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                  '${selectedDate.minute} : ${selectedDate.hour} ',
                                  style: TextStyle(
                                    fontSize: ScreenHeight! / 65,
                                    fontFamily: 'Cairo-VariableFont_slnt',
                                    color: Colors.grey,
                                  ),
                                ),
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text:
                                  '  ${List_Response[Temp_Index[i].toString()].toString()}',
                                  style: TextStyle(
                                    fontSize: ScreenWidth! / 25,
                                    fontFamily: 'Seven-Segment',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: ' WH',
                                  style: TextStyle(
                                      fontSize: ScreenWidth! / 45,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: '  تم استهلاك',
                                  style: TextStyle(
                                    fontSize: ScreenHeight! / 65,
                                    fontFamily: 'Cairo-VariableFont_slnt',
                                    color: Colors.grey,
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 10,
                          left: 10,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              //Navigator.of(context).pop();
                            });
                          },
                          child: Container(
                            width: ScreenWidth! / 25,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset(
                                'assets/icons/power-profile-performance-svgrepo-com.svg',
                                width: ScreenWidth! / 30,
                                height: ScreenHeight! / 30,
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Orange,
                              borderRadius: BorderRadius.circular(10),
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
        )
            : SizedBox(
          height: 0,
        );
      },
    );
  }
}
*/
