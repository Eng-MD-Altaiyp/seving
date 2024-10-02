import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:phlox_animations/phlox_animations.dart';

import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';
import '../localization/app_localizations.dart';

class All_Deitals extends StatefulWidget {
  const All_Deitals({super.key});

  @override
  State<All_Deitals> createState() => _All_DeitalsState();
}

class _All_DeitalsState extends State<All_Deitals> {

  bool check_con = false;

  final formatter = NumberFormat.currency(
    locale: 'ar_SA',
    symbol: lang == 'English' ? 'SAR' : 'ريال',
    decimalDigits: 1,
  );

  double Seved = 0.0;
  double Remaining = 0.0;
  double Required = 0.0;
  int Counter = 0;

  Future<List>  Get_All_Data()async
  {

        var readData = await data_metter.readData("""
          SELECT * FROM 'goals'
          WHERE "amount_paid" < "goal_price"
      """);
        Counter = 0;
         Seved = 0.0;
         Remaining = 0.0;
         Required = 0.0;

        List Seveded = [];
        List Remained = [];
        List Requireded = [];

        for (var element in readData) {
          Counter+=1;
          print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk ${Counter}');
          element.forEach((key, value) {
            if (key == 'goal_price') {
              Seveded.add(value);
            }
            if (key == 'amount_paid') {
              Remained.add(value);
            }
          });
        }
        for (var Value in Seveded) {
          Required += Value;
        }
        for (var Value in Remained) {
          Seved += Value;
        }
        Remaining = Required - Seved;


    return readData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Get_All_Data();
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Get_All_Data(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: Lottie.asset(
                "assets/animations/not-found.json",
                width: 150,
                height: 150,
              ));
        } else if (snapshot.hasError) {
          return Center(
              child: Lottie.asset(
                "assets/lottie/Animation - 1727715298664.json",
                width: 150,
                height: 150,
              ));
        } else if (snapshot.hasData) {
          return PhloxAnimations(
            duration: const Duration(milliseconds: 300),
            fromOpacity: 0.1,
            fromY: -50,
            child: Container(
              child: Center(
                child: PhloxAnimations(
                  duration: const Duration(milliseconds: 200),
                  fromOpacity: 0.1,
                  fromY: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Container(
                      height: ScreenHeight! / 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.topRight,
                        //   end: Alignment.bottomLeft,
                        //   colors: [
                        //     Colors.white54,
                        //     Colors.white60,
                        //     Colors.white,
                        //   ],
                        // ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: LayoutBuilder(builder: (context, sizes) {
                        double w1 = sizes.maxWidth;
                        double h1 = sizes.maxHeight;
                        return Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // color: Colors.pinkAccent,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                // color: Colors.red,
                                                child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                        context)
                                                        .Seved,
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors
                                                          .grey.shade800,
                                                      fontFamily:
                                                      'QTSManga',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                // color: Colors.blueAccent,
                                                child: Center(
                                                  child: Text(
                                                    formatter
                                                        .format(Seved),
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Orange,
                                                      fontFamily:
                                                      'QTSManga',
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: lang ==
                                                      'English'
                                                      ? Border(
                                                    bottom: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                    right: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                  )
                                                      : Border(
                                                    bottom: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                    left: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        // color: Colors.yellow,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                // color: Colors.grey,
                                                child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                        context)
                                                        .Remaining,
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors
                                                          .grey.shade800,
                                                      fontFamily:
                                                      'QTSManga',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                // color: Colors.blueAccent,
                                                child: Center(
                                                  child: Text(
                                                    formatter.format(
                                                        Remaining),
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Orange,
                                                      fontFamily:
                                                      'QTSManga',
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: lang ==
                                                      'English'
                                                      ? Border(
                                                    top: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                    right: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                  )
                                                      : Border(
                                                    top: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                    left: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                  ),
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
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // color: Colors.yellow,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                // color: Colors.blueAccent,
                                                child: Center(
                                                  child: Text(
                                                    '${snapshot.data!.length}',
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: On_Of_color,
                                                      fontFamily:
                                                      'QTSManga',
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: lang ==
                                                      'English'
                                                      ? Border(
                                                    bottom: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                    left: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                  )
                                                      : Border(
                                                    bottom: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                    right: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                // color: Colors.grey,
                                                child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                        context)
                                                        .Counter,
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors
                                                          .grey.shade800,
                                                      fontFamily:
                                                      'QTSManga',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        // color: Colors.pinkAccent,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                // color: Colors.blueAccent,
                                                child: Center(
                                                  child: Text(
                                                    formatter
                                                        .format(Required),
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Orange,
                                                      fontFamily:
                                                      'QTSManga',
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: lang ==
                                                      'English'
                                                      ? Border(
                                                    top: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                    left: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                  )
                                                      : Border(
                                                    top: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                    right: BorderSide(
                                                        color:
                                                        Orange,
                                                        width: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                // color: Colors.grey,
                                                child: Center(
                                                  child: Text(
                                                    AppLocalizations.of(
                                                        context)
                                                        .Required,
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors
                                                          .grey.shade800,
                                                      fontFamily:
                                                      'QTSManga',
                                                    ),
                                                  ),
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
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(child: Text('No data available.'));
        }
      },
    );
  }
}
