import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:phlox_animations/phlox_animations.dart';
import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';
import '../Widgets/Notifications_List.dart';

class Notifications_Screen extends StatefulWidget {
  const Notifications_Screen({super.key});

  @override
  State<Notifications_Screen> createState() => _Notifications_ScreenState();
}

class _Notifications_ScreenState extends State<Notifications_Screen> {
  // int? _sliding = 0;

  Future<void> _handleRefresh() async {}


  @override
  Widget build(BuildContext context) {
    int counterNotifications = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        title: Text(
          'الإشعارات',
          style: TextStyle(
            fontSize: ScreenHeight!/30,
            fontFamily: 'Montserrat-Bold',
            color: Colors.white,
          ),
        ),
        elevation: 0,
        flexibleSpace: Image.asset(
          'assets/images/app-bar-background-top.png',
          fit: BoxFit.fill,
        ),
        leading: const Text(''),
        actions: [
          PhloxAnimations(
            duration: const Duration(milliseconds: 400),
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
                  width: ScreenWidth!/9,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-right.svg',
                      color: primary100,
                    ),
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
          height: ScreenHeight! / 25,
          decoration: const BoxDecoration(
            //color: accent200,
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/app-bar-background-bottom.png'),
              fit: BoxFit.fill,
            ),
          ),
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
                  onRefresh: _handleRefresh, // refresh callback
                  child: PhloxAnimations(
                    duration: const Duration(milliseconds:  200),
                    fromOpacity: 0.1,
                    fromX: 50,
                    child: ListView.builder(
                      itemCount: Counter_Notifications,
                      itemBuilder: (context, i) {
                        counterNotifications += 1;
                        return Notifications_List(
                          counter_notifications: counterNotifications,
                        );
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
}
