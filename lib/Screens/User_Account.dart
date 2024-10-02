import 'package:phlox_animations/phlox_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../Models/Models_And_Classes/Colors.dart';
import '../localization/app_localizations.dart';
import 'User_Setting_Account/Support.dart';

class User_Account extends StatefulWidget {
  const User_Account({super.key});

  @override
  State<User_Account> createState() => _User_AccountState();
}

class _User_AccountState extends State<User_Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWidth,
      height: ScreenHeight,
      color: background,
      child: LayoutBuilder(builder: (context, sizes) {
        double w1 = sizes.maxWidth;
        double h1 = sizes.maxHeight;
        return Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    width: w1,
                    height: h1 / 9,
                    decoration: const BoxDecoration(
                      //color: accent200,
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/app-bar-background.png'),
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
                        AppLocalizations.of(context).Settings,
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
              flex: 6,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 60, right: 10, left: 10, bottom: 10),
                            child: SizedBox(
                              width: ScreenWidth,
                              child: Padding(
                                padding: EdgeInsets.only(right: 8,left: 8),
                                child: PhloxAnimations(
                                  duration: Duration(milliseconds: 150),
                                  fromOpacity: 0.1,
                                  fromX: lang != 'English' ? 50 : -50,
                                  child: Text(
                                    AppLocalizations.of(context).User_About,
                                    textAlign: lang != 'English' ? TextAlign.right:TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenHeight! / 40,
                                      fontFamily: 'Cairo-VariableFont_slnt',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          conr(
                              Icon(
                                Icons.chevron_right,
                                color: color2p,
                                size: ScreenHeight! / 23,
                              ),
                              AppLocalizations.of(context).Settings,
                              AppLocalizations.of(context).Setting_subtitle,
                              "assets/icons/setting.svg",
                              "Settings"),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8,left: 8),
                                child: PhloxAnimations(
                                  duration: const Duration(milliseconds: 150),
                                  fromOpacity: 0.1,
                                  fromX: lang != 'English' ? 50 : -50,
                                  child: Text(
                                    AppLocalizations.of(context).Other_settings,
                                    textAlign:lang != 'English' ? TextAlign.right:TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenHeight! / 46,
                                      fontFamily: 'Cairo-VariableFont_slnt',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          conr(
                              Icon(
                                Icons.chevron_right,
                                color: color2p,
                                size: ScreenHeight! / 23,
                              ),
                              AppLocalizations.of(context).Support_title,
                              AppLocalizations.of(context).Support_subtitle,
                              "assets/icons/call-calling-2.svg",
                              "support"),
                          conr(
                              Icon(
                                Icons.chevron_right,
                                color: color2p,
                                size: ScreenHeight! / 23,
                              ),
                              AppLocalizations.of(context).About_title,
                              AppLocalizations.of(context).About_subtitle,
                              "assets/icons/info-circle.svg",
                              "About_Enaiaty"),
                          conr(
                              Icon(
                                Icons.chevron_right,
                                color: color2p,
                                size: ScreenHeight! / 23,
                              ),
                              AppLocalizations.of(context).Developer_title,
                              AppLocalizations.of(context).Developer_subtitle,
                              "assets/icons/map.svg",
                              "developer"),
                          conr(
                              Icon(
                                Icons.chevron_right,
                                color: color2p,
                                size: ScreenHeight! / 23,
                              ),
                              AppLocalizations.of(context).Update_title,
                              Version_Info,
                              "assets/icons/refresh-2.svg",
                              "updates"),
                        ],
                      )),
            ),
          ],
        );
      }),
    );
  }

  // Arabic Language Widget
  Widget conr(
      Widget icon, String Ttext, String Btext, String image, String function) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
      child: InkWell(
        onTap: () {
          setState(() {
            if (function == "Settings") {
              Navigator.pushNamed(context, '/Settings');
            } else if (function == "support") {
              showModalBottomSheet(
                isScrollControlled: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => support(),
              );
            } else if (function == "About_Enaiaty") {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> About_Enaiaty() ));
            } else if (function == "developer") {
              // showModalBottomSheet(
              //   isScrollControlled: false,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   backgroundColor: Colors.transparent,
              //   context: context,
              //   builder: (context) => const support(text1: 'Smart Meter'),
              // );
            } else if (function == "updates") {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> updates() ));
            }
          });
        },
        child: PhloxAnimations(
          duration: const Duration(milliseconds: 200),
          fromOpacity: 0.1,
          fromX: 50,
          child: Container(
            width: ScreenWidth,
            height: ScreenHeight! / 12,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, right: 15, bottom: 5, left: 15),
                    child: Container(
                      width: ScreenWidth! / 18,
                      height: ScreenHeight! / 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: color1,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          image,
                          width: ScreenWidth! / 35,
                          height: ScreenHeight! / 35,
                          color: color3,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Ttext,
                          style: TextStyle(
                            fontSize: ScreenHeight! / 46,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo-VariableFont_slnt',
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          Btext,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color2p,
                            fontSize: ScreenHeight! / 60.3,
                            fontFamily: 'Cairo-VariableFont_slnt',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 5, bottom: 5, right: 8),
                    child: Container(
                      child: icon,
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

// English Language Widget
//   Widget conl(
//       Widget icon, String Ttext, String Btext, String image, String function) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
//       child: InkWell(
//         onTap: () {
//           setState(() {
//             if (function == "Settings") {
//               //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Settings() ));
//             } else if (function == "support") {
//               // showModalBottomSheet(
//               //   isScrollControlled: false,
//               //   shape: RoundedRectangleBorder(
//               //     borderRadius: BorderRadius.circular(10),
//               //   ),
//               //   backgroundColor: Colors.transparent,
//               //   context: context,
//               //   builder: (context) => const support(
//               //     text1: 'Smart Meter',
//               //   ),
//               // );
//             } else if (function == "About_Enaiaty") {
//               //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> About_Enaiaty() ));
//             } else if (function == "developer") {
//               // showModalBottomSheet(
//               //   isScrollControlled: false,
//               //   shape: RoundedRectangleBorder(
//               //     borderRadius: BorderRadius.circular(10),
//               //   ),
//               //   backgroundColor: Colors.transparent,
//               //   context: context,
//               //   builder: (context) => const support(
//               //     text1: 'Smart Meter',
//               //   ),
//               // );
//             } else if (function == "updates") {
//               // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> updates() ));
//             }
//           });
//         },
//         child: PhloxAnimations(
//           duration: const Duration(milliseconds: 200),
//           fromOpacity: 0.1,
//           fromX: -50,
//           child: Container(
//             width: ScreenWidth,
//             height: ScreenHeight! / 12,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(top: 5, right: 20, bottom: 5, left: 10),
//                     child: Container(
//                       width: ScreenWidth! / 18,
//                       height: ScreenHeight! / 18,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: color1,
//                       ),
//                       child: Center(
//                         child: SvgPicture.asset(
//                           image,
//                           width: ScreenWidth! / 35,
//                           height: ScreenHeight! / 35,
//                           color: color3,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 6,
//                   child: Container(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(Ttext,
//                             style: TextStyle(
//                               fontSize: ScreenHeight! / 46,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Cairo-VariableFont_slnt',
//                             )),
//                         const SizedBox(
//                           height: 2,
//                         ),
//                         Text(
//                           Btext,
//                           style: TextStyle(
//                             color: color2p,
//                             fontSize: ScreenHeight! / 60.3,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 8),
//                     child: Container(
//                       child: icon,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
}
