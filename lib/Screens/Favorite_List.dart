import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:seving/localization/app_localizations.dart';
import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';

class Favorite_List extends StatefulWidget {
  const Favorite_List({super.key});

  @override
  State<Favorite_List> createState() => _Favorite_ListState();
}

class _Favorite_ListState extends State<Favorite_List> {

  Future<void> _handleRefresh() async {
    return Future.delayed(
        const Duration(seconds: 2),
        Get_Date,
    );
  }

  Future<List> Get_Date() async {
    var readData = await data_metter.readData("""
          SELECT * FROM 'goals'
          WHERE "goal_Favorite" = 1
      """);
    return readData;
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
  String goal_Favorite(int Favorite)
  {
    String A = '';
    if(Favorite == 0)
      A= 'assets/icons/favorite-unselected.svg';
    else if(Favorite == 1)
      A = 'assets/icons/favorite-selected.svg';

    return A;
  }

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
    } return type;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWidth,
      height: ScreenHeight,
      color: background,
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  width: ScreenWidth,
                  height: ScreenHeight! / 13,
                  decoration: const BoxDecoration(
                    //color: accent200,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/app-bar-background-bottom.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 35,
                right: 35,
                child: Center(
                  child: PhloxAnimations(
                    duration: const Duration(milliseconds:  100),
                    fromOpacity: 0.1,
                    fromY: -50,
                    child: Text(
                     AppLocalizations.of(context).Favorite_List,
                      style: TextStyle(
                          fontSize: ScreenHeight!/24,
                          fontFamily: 'Cairo-VariableFont_slnt',
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: ScreenWidth,
              child: LiquidPullToRefresh(
                backgroundColor: Orange,
                color: Blue_app,
                height: ScreenHeight!/15,
                borderWidth: 0.7,
                onRefresh: _handleRefresh,
                // refresh callback
                child: PhloxAnimations(
                  duration: const Duration(milliseconds:  200),
                  fromOpacity: 0.1,
                  fromX: 50,
                  child: FutureBuilder(
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

                        return ListView.builder(
                          itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Container(
                                width: ScreenWidth,
                                height: ScreenHeight!/7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
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
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: ()
                                            {
                                              setState(() {
                                                Edite_Favorite(snapshot.data![i]['goals_id'],snapshot.data![i]['goal_Favorite']);
                                              });
                                            },
                                            child: SvgPicture.asset(
                                              goal_Favorite(snapshot.data![i]['goal_Favorite']),
                                              // color: On_Of_color,
                                              width: 30,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text(
                                                    snapshot.data![i]['goal_type'],
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.grey.shade700,
                                                      fontFamily: 'Cairo-VariableFont_slnt',
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: SvgPicture.asset(
                                                    Type_Goal(snapshot.data![i]['goal_type']),
                                                    color: On_Of_color,
                                                    width: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text("${snapshot.data![i]['goals_id']}"),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).Text_Goal_Name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: primary200,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).Text_Goal_Price,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Orange,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).Amount_paid,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: primary200,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).Start_date,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Orange,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).Monthly_payment,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: primary200,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations.of(context).Expected,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Orange,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              snapshot.data![i]['goal_name'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: primary200,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              snapshot.data![i]['goal_price'].round().toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Orange,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              snapshot.data![i]['amount_paid'].round().toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: primary200,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              snapshot.data![i]['date_start'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Orange,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              snapshot.data![i]['monthly_payment'].round().toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: primary200,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
                                            ),
                                            Text(
                                              "${expected(snapshot.data![i]['monthly_payment'],snapshot.data![i]['goal_price'],snapshot.data![i]['date_start'])}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Orange,
                                                fontFamily: 'Cairo-VariableFont_slnt',
                                              ),
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
                      } else {
                        return Center(child: Text('No data available.'));
                      }
                    },
                  ),
                ),
              ),

              /*ListView.builder(
                itemCount: notifications,
                itemBuilder: (context, i) {
                  counter_notifications+=1;
                  return
                    Notifications_List(counter_notifications: counter_notifications,);
                }
            ),
            */
            ),
            //Search_Bar(),
            //Services(),
          ),
        ],
      ),
    );
  }
}

// class Lists extends StatefulWidget {
//   final List list;
//   final counter_notifications;
//   const Lists({super.key, required this.counter_notifications,required this.list});
//
//   @override
//   State<Lists> createState() => _ListsState();
// }
//
// class _ListsState extends State<Lists> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         top: 10,
//         left: 10,
//         right: 10,
//         bottom: 10,
//       ),
//       child: Container(
//         width: ScreenWidth,
//         height: ScreenHeight!/9,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade500,
//               offset: const Offset(4, 4),
//               blurRadius: 15,
//               spreadRadius: 1,
//             ),
//             const BoxShadow(
//               color: Colors.white,
//               offset: Offset(-4, -4),
//               blurRadius: 15,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: ()
//                     {
//                       setState(() {
//                         Edite_Favorite(list[counter_notifications]['goals_id'],list[counter_notifications]['goal_Favorite']);
//                       });
//                     },
//                     child: SvgPicture.asset(
//                       goal_Favorite(list[counter_notifications]['goal_Favorite']),
//                       // color: On_Of_color,
//                       width: 30,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Text(
//                       "1",
//                       style: TextStyle(color: primary200, fontSize: 17),
//                     ),
//                   ),
//                   Text("${counter_notifications}"),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     "3",
//                     style: TextStyle(color: primary200),
//                   ),
//                   Text(
//                     "4",
//                     style: TextStyle(color: primary200),
//                   ),
//                   Text(
//                     "5",
//                     style: TextStyle(color: primary200),
//                   ),
//                   Text(
//                     "6",
//                     style: TextStyle(
//                       color: primary200,
//                     ),
//                   ),
//                   Text(
//                     "7",
//                     style: TextStyle(
//                       color: primary200,
//                     ),
//                   ),
//                   Text(
//                     "9",
//                     style: TextStyle(color: primary200),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
