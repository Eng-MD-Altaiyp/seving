import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:seving/localization/app_localizations.dart';

import '../../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../../Models/Models_And_Classes/Colors.dart';

class Search_Bar extends StatefulWidget {
  const Search_Bar({super.key});

  @override
  State<Search_Bar> createState() => _Search_BarState();
}

class _Search_BarState extends State<Search_Bar> {
  TextEditingController Search_Text = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 5,),
      child: PhloxAnimations(
        duration: const Duration(milliseconds: 150),
        fromOpacity: 0.1,
        fromY: -50,
        child: Container(
          height: ScreenHeight!/23,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(ScreenWidth!/45),
            boxShadow: [
              BoxShadow(
                color: primary200,
                blurRadius: 2,
                spreadRadius: 1,
                offset: const Offset(
                  2,
                  2,
                ),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  focusColor: primary100,
                  borderRadius: BorderRadius.circular(ScreenWidth!/45),
                  onTap: () {
                    setState(() {
                      // showModalBottomSheet(
                      //   isScrollControlled: false,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(ScreenWidth!/45),
                      //   ),
                      //   backgroundColor: Colors.transparent,
                      //   context: context,
                      //   builder: (context) => const support(text1: 'Not Found'),
                      // );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      //color: accent200,
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/app-bar-background-top.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: lang == 'English' ? BorderRadius.only(
                        topLeft: Radius.circular(ScreenWidth!/45),
                        bottomLeft: Radius.circular(ScreenWidth!/45),
                      ): BorderRadius.only(
                        topRight: Radius.circular(ScreenWidth!/45),
                        bottomRight: Radius.circular(ScreenWidth!/45),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/search.svg",
                        width: ScreenWidth!/32,
                        height: ScreenHeight!/32,
                        color: primary100,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: bg100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ScreenWidth!/45),
                      bottomLeft: Radius.circular(ScreenWidth!/45),
                    ),
                  ),
                  child: Align(
                    alignment:lang == 'English' ? Alignment.bottomLeft:Alignment.bottomRight,
                    child: TextField(
                      controller: Search_Text,
                      onSubmitted: (NJ) {
                        setState(() {
                          // showModalBottomSheet(
                          //   isScrollControlled: false,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(ScreenWidth!/45),
                          //   ),
                          //   backgroundColor: Colors.transparent,
                          //   context: context,
                          //   builder: (context) => support(text1: Search_Text),
                          // );
                        });
                      },
                      textAlign: lang == 'English' ? TextAlign.left: TextAlign.right,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context).Search_about,
                          hintStyle: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: ScreenWidth!/27,
                              fontFamily: 'Cairo-VariableFont_slnt'),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
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
}
