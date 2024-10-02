import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:phlox_animations/phlox_animations.dart';
import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';

class List_Screen extends StatefulWidget {
  const List_Screen({super.key});

  @override
  State<List_Screen> createState() => _List_ScreenState();
}

class _List_ScreenState extends State<List_Screen> {
  Future<void> _handleRefresh() async {}

  @override
  Widget build(BuildContext context) {
    int counterNotifications = 0;
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
                    duration: const Duration(milliseconds: 100),
                    fromOpacity: 0.1,
                    fromY: -50,
                    child: Text(
                      "List",
                      style: TextStyle(
                          fontSize: ScreenHeight! / 24,
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
                height: ScreenHeight! / 15,
                borderWidth: 0.7,
                onRefresh: _handleRefresh,
                // refresh callback
                child: PhloxAnimations(
                  duration: const Duration(milliseconds: 200),
                  fromOpacity: 0.1,
                  fromX: 50,
                  child: Lists(),
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

class Lists extends StatefulWidget {
  const Lists({
    super.key,
  });

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  Map<int, Map<String, dynamic>> list = {
    1: {
      "Type": "Car",
      "Name": "Mercedes",
      "Price": 3000.0,
      "Speed": 150.0,
      "Motor": 2000,
      "Break": 90.0,
      "Model": 2021,
      "Image": "assets/Cars/1.png"
    },
    2: {
      "Type": "Truck",
      "Name": "Ford",
      "Price": 5000.5,
      "Speed": 120.0,
      "Motor": 3000,
      "Break": 85.0,
      "Model": 2018,
      "Image": "assets/Cars/2.png"
    },
    3: {
      "Type": "Motorcycle",
      "Name": "Suzuki",
      "Price": 2000.0,
      "Speed": 180.0,
      "Motor": 600,
      "Break": 95.0,
      "Model": 2019,
      "Image": "assets/Cars/3.png"
    },
    4: {
      "Type": "Car",
      "Name": "Toyota",
      "Price": 2500.0,
      "Speed": 140.0,
      "Motor": 1800,
      "Break": 87.5,
      "Model": 2020,
      "Image": "assets/Cars/4.png"
    },
    5: {
      "Type": "Car",
      "Name": "BMW",
      "Price": 4500.0,
      "Speed": 160.0,
      "Motor": 2200,
      "Break": 92.0,
      "Model": 2022,
      "Image": "assets/Cars/5.png"
    },
    6: {
      "Type": "Truck",
      "Name": "Chevrolet",
      "Price": 5500.0,
      "Speed": 110.0,
      "Motor": 3500,
      "Break": 88.0,
      "Model": 2017,
      "Image": "assets/Cars/6.png"
    },
    7: {
      "Type": "Motorcycle",
      "Name": "Yamaha",
      "Price": 2200.0,
      "Speed": 170.0,
      "Motor": 800,
      "Break": 96.0,
      "Model": 2021,
      "Image": "assets/Cars/7.png"
    },
    8: {
      "Type": "Car",
      "Name": "Honda",
      "Price": 2700.0,
      "Speed": 130.0,
      "Motor": 1900,
      "Break": 89.0,
      "Model": 2016,
      "Image": "assets/Cars/8.png"
    },
    9: {
      "Type": "Truck",
      "Name": "Ram",
      "Price": 6000.0,
      "Speed": 100.0,
      "Motor": 4000,
      "Break": 90.5,
      "Model": 2015,
      "Image": "assets/Cars/9.png"
    },
    10: {
      "Type": "Motorcycle",
      "Name": "Harley-Davidson",
      "Price": 2800.0,
      "Speed": 160.0,
      "Motor": 700,
      "Break": 97.0,
      "Model": 2022,
      "Image": "assets/Cars/10.png"
    },
    11: {
      "Type": "Car",
      "Name": "Nissan",
      "Price": 2300.0,
      "Speed": 145.0,
      "Motor": 1700,
      "Break": 85.0,
      "Model": 2018,
      "Image": "assets/Cars/11.png"
    },
    12: {
      "Type": "Truck",
      "Name": "Volvo",
      "Price": 6500.0,
      "Speed": 115.0,
      "Motor": 4500,
      "Break": 89.5,
      "Model": 2020,
      "Image": "assets/Cars/12.png"
    },
    13: {
      "Type": "Motorcycle",
      "Name": "Ducati",
      "Price": 2900.0,
      "Speed": 175.0,
      "Motor": 850,
      "Break": 98.0,
      "Model": 2021,
      "Image": "assets/Cars/13.png"
    },
    14: {
      "Type": "Car",
      "Name": "Audi",
      "Price": 3200.0,
      "Speed": 155.0,
      "Motor": 2100,
      "Break": 91.0,
      "Model": 2019,
      "Image": "assets/Cars/14.png"
    },
    15: {
      "Type": "Truck",
      "Name": "GMC",
      "Price": 7000.0,
      "Speed": 105.0,
      "Motor": 5000,
      "Break": 90.0,
      "Model": 2017,
      "Image": "assets/Cars/15.png"
    },
    16: {
      "Type": "Car",
      "Name": "Lexus",
      "Price": 4000.0,
      "Speed": 150.0,
      "Motor": 2500,
      "Break": 90.0,
      "Model": 2021,
      "Image": "assets/Cars/1.png"
    },
    17: {
      "Type": "Motorcycle",
      "Name": "Kawasaki",
      "Price": 2400.0,
      "Speed": 185.0,
      "Motor": 900,
      "Break": 96.0,
      "Model": 2019,
      "Image": "assets/Cars/2.png"
    },
    18: {
      "Type": "Truck",
      "Name": "Scania",
      "Price": 7500.0,
      "Speed": 110.0,
      "Motor": 4800,
      "Break": 91.5,
      "Model": 2018,
      "Image": "assets/Cars/3.png"
    },
    19: {
      "Type": "Car",
      "Name": "Tesla",
      "Price": 5200.0,
      "Speed": 170.0,
      "Motor": 0, // كهربائي
      "Break": 93.0,
      "Model": 2022,
      "Image": "assets/Cars/4.png"
    },
    20: {
      "Type": "Motorcycle",
      "Name": "BMW Motorrad",
      "Price": 3100.0,
      "Speed": 190.0,
      "Motor": 1000,
      "Break": 95.0,
      "Model": 2021,
      "Image": "assets/Cars/5.png"
    }
  };
  final formatter = NumberFormat.currency(
    locale: 'ar_SA',
    symbol: lang == 'English' ? 'SAR' : 'ريال',
    decimalDigits: 1,
  );
  @override
  Widget build(BuildContext context) {
    final keysList = list.keys.toList();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        final itemData = list[keysList[i]];
        return Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 10,
            right: 10,
            bottom: 5,
          ),
          child: Container(
            width: ScreenWidth,
            height: ScreenHeight! / 5,
            // color: Colors.red,
            child: LayoutBuilder(builder: (context, sizes) {
                      double w1 = sizes.maxWidth;
                      double h1 = sizes.maxHeight;
                      return Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, bottom: 8, top: 50),
                        child: Container(
                          width: w1/1.05,
                          height: h1 / 1.5,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/new-star-svgrepo-com.svg",
                                    color: Colors.amber,
                                    width: ScreenWidth! / 32,
                                    height: ScreenHeight! / 32,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Text(
                                      "${itemData?["Name"]}",
                                      style: TextStyle(
                                          color: primary200, fontSize: 17),
                                    ),
                                  ),
                                  Text(""),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${itemData?["Speed"]}",
                                      style: TextStyle(color: primary200),
                                    ),
                                    Text(
                                        formatter
                                            .format(itemData?["Price"]),
                                      style: TextStyle(color: Orange),
                                    ),
                                    Text(
                                      "${itemData?["Motor"]}",
                                      style: TextStyle(color: primary200),
                                    ),
                                    Text(
                                      "${itemData?["Break"]}",
                                      style: TextStyle(
                                        color: primary200,
                                      ),
                                    ),
                                    Text(
                                      "${itemData?["Model"]}",
                                      style: TextStyle(
                                        color: primary200,
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
                    Positioned(
                      top: 0,
                      right: 40,
                      left: 40,
                      child: Container(
                        height: h1/1.6,
                        child: Center(
                          child: Image.asset('${itemData?["Image"]}'),
                        ),
                        // color: Colors.red,
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        );
      },
    );
  }
}
