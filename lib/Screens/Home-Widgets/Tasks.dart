import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:sqflite/sqflite.dart';
import '../../Databease/Get_Date.dart';
import '../../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../../Models/Models_And_Classes/Colors.dart';
import '../../Widgets/All_Deitals.dart';
import '../../localization/app_localizations.dart';



class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final formatter = NumberFormat.currency(
    locale: 'ar_SA',
    symbol: lang == 'English' ? 'SAR' : 'ريال',
    decimalDigits: 1,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Get_Date();
    });
  }

  Future<List> Get_Date() async {
    var readData = await data_metter.readData("""
          SELECT * FROM 'goals'
          WHERE "amount_paid" < "goal_price"
      """);
    return readData;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: ScreenHeight! / 3.1,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: ScreenHeight! / 12,
                decoration: const BoxDecoration(
                  //color: accent200,
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/app-bar-background-top.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: ScreenHeight! / 7,
                decoration: const BoxDecoration(
                  //color: accent200,
                  image: DecorationImage(
                    image: AssetImage('assets/images/app-bar-background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          top: 0,
          child: Container(
            // color: Colors.red,
            child: ListView(
              children: [
                All_Deitals(),
                PhloxAnimations(
                  duration: const Duration(milliseconds: 200),
                  fromOpacity: 0.1,
                  fromY: -50,
                  child: Container(
                    height: ScreenHeight! / 6,
                    width: double.infinity,
                    child: LayoutBuilder(builder: (context, sizes) {
                      // double w1 = sizes.maxWidth;
                      // double h1 = sizes.maxHeight;
                      return FutureBuilder(
                        future: Get_Date(),
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

                            return CarouselSlider(
                              items: offisr(snapshot.data!),
                              options: CarouselOptions(
                                aspectRatio: 2,
                                // autoPlay: true,
                                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                                // reverse: lang == 'English'
                                //     ? false : true,
                                autoPlayInterval: Duration(seconds: 5),
                                autoPlayAnimationDuration: Duration(seconds: 3),
                                enlargeCenterPage: true,
                                enableInfiniteScroll:  false,
                                viewportFraction: 0.86,
                                scrollDirection: Axis.horizontal,
                              ),
                            );
                          } else {
                            return Center(child: Text('No data available.'));
                          }
                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   top: 10,
        //   left: 20,
        //   right: 20,
        //   child: PhloxAnimations(
        //     duration: const Duration(milliseconds: 300),
        //     fromOpacity: 0.1,
        //     fromY: -50,
        //     child: Container(
        //       child: Center(
        //         child: PhloxAnimations(
        //           duration: const Duration(milliseconds: 200),
        //           fromOpacity: 0.1,
        //           fromY: 50,
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(vertical: 2),
        //             child: Container(
        //               height: ScreenHeight! / 10,
        //               width: double.infinity,
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(10),
        //               ),
        //               child: LayoutBuilder(builder: (context, sizes) {
        //                 double w1 = sizes.maxWidth;
        //                 double h1 = sizes.maxHeight;
        //                 return Column(
        //                   children:[],
        //                 );
        //               }),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: 20,
        //   left: 0,
        //   right: 0,
        //   child: PhloxAnimations(
        //     duration: const Duration(milliseconds: 200),
        //     fromOpacity: 0.1,
        //     fromY: -50,
        //     child: Container(
        //       height: ScreenHeight! / 6,
        //       child: LayoutBuilder(builder: (context, sizes) {
        //         double w1 = sizes.maxWidth;
        //         double h1 = sizes.maxHeight;
        //         return CarouselSlider(
        //           items: offisr(),
        //           options: CarouselOptions(
        //             aspectRatio: 2,
        //             autoPlay: true,
        //             autoPlayCurve: Curves.fastLinearToSlowEaseIn,
        //             reverse: true,
        //             autoPlayInterval: Duration(seconds: 5),
        //             autoPlayAnimationDuration: Duration(seconds: 3),
        //             enlargeCenterPage: true,
        //             enableInfiniteScroll: true,
        //             viewportFraction: 0.86,
        //             scrollDirection: Axis.horizontal,
        //           ),
        //         );
        //       }),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  // void main() async {
  //   final Database db = await openDatabase('SAVING_DB.db');
  //   await getGoalsAndPrint(db);
  // }

  List Burger_Food_Images = [1, 2, 3, 4, 5, 5, 4, 4];
  // double Ratio = 55.6;
  double Ratio(double amountPaid, double totalDebt)
  {
    double percentagePaid = (amountPaid / totalDebt) * 100;

    return percentagePaid;
  }

 String expected(double monthly_payment, double totalDebt, var date)
  {
    int monthsRequired = 0;

    while (totalDebt > 0) {
      totalDebt -= monthly_payment;
      monthsRequired++;
    }

    List<String> dateParts = date.split(' / ');

    int month = int.parse(dateParts[0].trim());
    int year = int.parse(dateParts[1].trim());



    int endMonth = (month + monthsRequired) % 12;
    int additionalYears = (month + monthsRequired) ~/ 12;
    int endYear = year + additionalYears;

    if (endMonth == 0) {
      endMonth = 12;
      endYear -= 1;
    }

    print("ستقوم بسداد آخر قسط في شهر $endMonth من سنة $endYear.");


    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${month}');
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${year}');

    return  endYear.toString()+" / "+endMonth.toString();
  }



  // String Type_goal_name = '';
 String Type_Goal(String type)
  {
    if(type == 'Motorbike') {
      type = 'assets/icons/motorbike-motorcycle-svgrepo-com.svg';
    } else if(type == 'Phone')
    {
      type = 'assets/icons/smartphone-2-svgrepo-com.svg';
    } else if(type == 'Truck')
    {
      type = 'assets/icons/service-type-4.svg';
    } else if(type == 'Car')
    {
      type = 'assets/icons/service-type-6.svg';
    } else if(type == 'Other')
    {
      type = 'assets/icons/other-address.svg';
    } return type;
  }



  String Type_Goal_Name(String type)
  {
    if(type == 'Motorbike') {
      type  = '${AppLocalizations.of(context).BuyMotorbike}';
    } else if(type == 'Phone')
    {
      type  = '${AppLocalizations.of(context).BuyPhone}';
    } else if(type == 'Truck')
    {
      type = '${AppLocalizations.of(context).BuyTruck}';
    } else if(type == 'Car')
    {
      type = '${AppLocalizations.of(context).BuyCar}';
    } else if(type == 'Other')
    {
      type = '${AppLocalizations.of(context).BuyOther}';
    } return type;
  }

  String goal_Favorite(int Favorite)
  {
    String A = '';
    if(Favorite == 0)
      A= 'assets/icons/favorite-unselected.svg';
    else if(Favorite == 1)
      A = 'assets/icons/favorite-selected.svg';

    return A;
  }

  Edite_Favorite(int Id,int favorite)async
  {
    if(favorite == 1)
      favorite = 0;
    else
      favorite = 1;

    int updateD = await data_metter.updateData("""
      UPDATE  'goals' SET
       'goal_Favorite' = ${favorite.toInt()}
        WHERE goals_id = ${Id.toInt()}
      """);
    print('update_d OnLine ===========  RealTimeReads_Table  =========== $updateD');

  }


  double Remaininged(double amount_paid,double goal_price)
  {
    double reuilt = goal_price - amount_paid;
    return reuilt;
  }
  double Requireded(double amount_paid,double goal_price,double monthly_payment)
  {
    double reuilt = monthly_payment;
    double Test = goal_price - amount_paid;

    if(Test > monthly_payment)
      reuilt = monthly_payment;
    else
      reuilt = Test;

    return reuilt;
  }
  Future<int> Piad(double amount_paid,double goal_price,double monthly_payment,int Id)
  async
  {
    double reuilt = monthly_payment;
    double Test = goal_price - amount_paid;

    if(Test > monthly_payment)
      reuilt = monthly_payment;
    else
      reuilt = Test;

    double End_Price = amount_paid + reuilt;

    int? updateD;
    try{
       updateD = await data_metter.updateData("""
      UPDATE  'goals' SET
       'amount_paid' = ${End_Price.toDouble()}
        WHERE goals_id = ${Id.toInt()}
      """);
       if(updateD == 1)
         {
           Navigator.of(context).pop();
           con("${AppLocalizations.of(context).Added_Succ}",
               "assets/icons/order-sent-successfully.svg", true);
         }
       else
         {
           con("Error}",
               "assets/icons/warning.svg", false);
         }
    }
    catch(e)
    {
      con("${e}",
          "assets/icons/warning.svg", false);
    }

    return updateD!;
  }

  Widget Paid_Amount(var list) {
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
                                                .Remaining1,
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
                                                .Required,
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
                                            list['goal_name'],
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
                                            list['goal_price'].toString(),
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
                                            "${Remaininged(list['amount_paid'],list['goal_price'])}",
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
                                            "${Requireded(list['amount_paid'],list['goal_price'],list['monthly_payment'])}",
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
                                      Piad(list['amount_paid'],list['goal_price'],list['monthly_payment'],list['goals_id']);

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

  List<Widget> offisr(List list) {

    return list.map(
      (e) {
        return ClipRRect(
          child: LayoutBuilder(builder: (context, sizes) {
            // print('uuuuuuuuuuuuuuuuuuuuuuuuuuuddddddddddddddddddddddddddd${e['goal_name']}');
            // double w1 = s izes.maxWidth;
            // double h1 = sizes.maxHeight;
            return InkWell(
              onTap: ()
              {
                setState(() {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return Paid_Amount(e);
                      });
                  // Paid_Amount(e);
                });
              },
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    Type_Goal_Name(e['goal_type']),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey.shade700,
                                      fontFamily: 'Cairo-VariableFont_slnt',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '${e['goal_name']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Orange,
                                      fontFamily: 'Cairo-VariableFont_slnt',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: SvgPicture.asset(
                                    Type_Goal(e['goal_type']),
                                    color: On_Of_color,
                                    width: 50,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: InkWell(
                                        onTap: ()
                                        {
                                          setState(() {
                                            Edite_Favorite(e['goals_id'],e['goal_Favorite']);
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          goal_Favorite(e['goal_Favorite']),
                                          // color: On_Of_color,
                                          width: 30,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5,vertical: 5),
                                        child: SvgPicture.asset(
                                          'assets/icons/edit-2.svg',
                                          color: On_Of_color,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5,vertical: 5),
                                        child: SvgPicture.asset(
                                          'assets/icons/trash.svg',
                                          color: delete2,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Align(
                                alignment: lang == 'English'
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.of(context)
                                            .Complate1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'Cairo-VariableFont_slnt',
                                        ),
                                      ),
                                      TextSpan(
                                        text: formatter.format(e['amount_paid']),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontFamily: 'Cairo-VariableFont_slnt',
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalizations.of(context)
                                            .Complate2,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.grey.shade700,
                                          fontFamily: 'Cairo-VariableFont_slnt',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: PollOption(
                                // name: 'mmn',
                                percentage: Ratio(e['amount_paid'],e['goal_price']),
                                // color: Orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        // color: Colors.green,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${AppLocalizations.of(context).Remaining1}: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.grey.shade500,
                                        fontFamily: 'Cairo-VariableFont_slnt',
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${(e["goal_price"] - e["amount_paid"]).round()}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Orange,
                                        fontFamily: 'Cairo-VariableFont_slnt',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${AppLocalizations.of(context).Expected}: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.grey.shade500,
                                        fontFamily: 'Cairo-VariableFont_slnt',
                                      ),
                                    ),
                                    TextSpan(
                                      text: "${expected(e['monthly_payment'],e['goal_price'],e['date_start'])}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Orange,
                                        fontFamily: 'Cairo-VariableFont_slnt',
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
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Orange,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      On_Of_color,
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    ).toList();
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

}

class PollOption extends StatelessWidget {
  final double percentage;

  PollOption({
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // الخلفية الرمادية للشريط
              Container(
                height: 20,
                child: percentage <= 80
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                          alignment: lang == 'English'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Text(
                            '${percentage.round()}%',
                            style: TextStyle(
                              color: On_Of_color,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    : null,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              // الشريط الملون الذي يعبر عن النسبة
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width * (percentage / 120),
                child: percentage > 80
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                          alignment: lang == 'English'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Text(
                            '$percentage%',
                            style: TextStyle(
                              color: On_Of_color,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    : null,
                decoration: BoxDecoration(
                  // color: color,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      On_Of_color,
                      Orange,
                      Orange,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

