import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';

class Consumption_List extends StatefulWidget {
  final List<String> list;
  final int i;

  const Consumption_List({super.key, required this.list, required this.i});

  @override
  State<Consumption_List> createState() => _Consumption_ListState();
}

class _Consumption_ListState extends State<Consumption_List> {
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
          padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10,),
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
                              text: widget.list[widget.i].toString(),
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
                              text: widget.list[widget.i].toString(),
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
                              text: widget.list[widget.i].toString(),
                              style: TextStyle(
                                fontSize: ScreenWidth! / 25,
                                fontFamily: 'Seven-Segment',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' KW',
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
                        decoration: BoxDecoration(
                          color: Orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            'assets/icons/power-profile-performance-svgrepo-com.svg',
                            width: ScreenWidth! / 30,
                            height: ScreenHeight! / 30,
                            color: Colors.white,
                          ),
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
    );
  }
}
