import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';

class Notifications_List extends StatefulWidget {
  final counter_notifications;

  const Notifications_List({super.key, required this.counter_notifications});

  @override
  State<Notifications_List> createState() => _Notifications_ListState();
}

class _Notifications_ListState extends State<Notifications_List> {
  DateTime timeBack = DateTime.now();


  @override
  Widget build(BuildContext context) {
    timeBack = DateTime.now();
    return Padding(
      padding: const EdgeInsets.only(
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
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${timeBack.month}/${timeBack.day} :${timeBack.hour}:${timeBack.minute}',
                          style: TextStyle(
                            fontSize: ScreenWidth!/40,
                            fontFamily: 'Cairo-VariableFont_slnt',
                            color: primary200,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Main Title',
                          style: TextStyle(
                            fontSize: ScreenHeight!/50,
                            fontFamily: 'Cairo-VariableFont_slnt',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
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
                            Navigator.of(context).pop();
                          });
                        },
                        child: Container(
                          width: ScreenWidth!/25,
                          decoration: BoxDecoration(
                            color: Orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              'assets/icons/notification.svg',
                              width: ScreenWidth!/30,
                              height: ScreenHeight!/30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            ' تجاوز إستهلاك',
                            style: TextStyle(
                              fontSize: ScreenHeight!/57,
                              fontFamily: 'Cairo-VariableFont_slnt',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: const Text('لقد تم تجاوز الحد الاقصى للإستهلاك'),
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
  }
}
