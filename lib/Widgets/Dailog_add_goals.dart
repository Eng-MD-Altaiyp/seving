import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seving/Models/Models_And_Classes/Colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../localization/app_localizations.dart';
import '../../Models/Models_And_Classes/Classes _and_barameters.dart';

class Dailog_add_goals extends StatefulWidget {
  const Dailog_add_goals({Key? key}) : super(key: key);

  @override
  State<Dailog_add_goals> createState() => _Dailog_add_goalsState();
}

class _Dailog_add_goalsState extends State<Dailog_add_goals> {

  DateTime Payment_Date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: ScreenHeight! / 1.5,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border(top: BorderSide(width: 3, color: green_god,),
                  bottom: BorderSide(width: 3, color: green_god,),),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10),
                      child: Container(
                        child: Text(
                          AppLocalizations
                              .of(context)
                              .Support_title,
                          style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                            fontFamily: 'Montserrat-Regular',
                          ),
                        ),
                        // alignment: Alignment.topRight,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        child: Text(
                          AppLocalizations
                              .of(context)
                              .Support_subtitle2,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontFamily: 'Montserrat-Regular',
                          ),
                        ),
                        // alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {},
                      child: connecation(
                          green_god,
                          'assets/icons/whatsapp-2.svg',
                          AppLocalizations
                              .of(context)
                              .WhatsApp_Serves,
                          'whtasapp1', '505585434787'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {},
                      child: connecation(
                          green_god,
                          'assets/icons/whatsapp-2.svg',
                          AppLocalizations
                              .of(context)
                              .WhatsApp_Serves,
                          'whtasapp2', '505585434787'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {},
                      child: connecation(
                          Blue_Border,
                          'assets/icons/email.svg',
                          'two2bitcode@gmail.com',
                          'gmail', '0'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {},
                      child: connecation(
                          Blue_Border,
                          'assets/icons/call-calling-2.svg',
                          '+966 505585434787',
                          'call', '505585434787'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Container(
                                      width: 200,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          AppLocalizations
                                              .of(context)
                                              .add_goal_butom,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontFamily: 'Montserrat-Regular',
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: green_god,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            AppLocalizations
                                                .of(context)
                                                .Cancel,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'Montserrat-Regular',
                                            ),
                                          ),
                                        ),

                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                              30),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _luanchurl(Uri url) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
        );
      } else {
        throw 'Could not launch $url';
      }
    } catch (_) {}
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeQueryComponent(e.value)}')
        .join('&');
  }

  Future<void> launchwhatsapp(@required phone, @required message) async {
    String url = "whatsapp://send?phone=$phone&text=$message";
    launchUrl(Uri.parse(url));
  }

  Widget connecation(Color color, String Image, String text, var Page,
      String Phone) {
    // Uri _url = Uri.parse(Page.toString());
    return Container(
      // color: Colors.cyan,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width:
              double.infinity,
              child: Align(
                alignment: lang == 'English' ? Alignment
                    .centerLeft : Alignment
                    .centerRight,
                child: Padding(
                  padding:
                  const EdgeInsets
                      .symmetric(horizontal: 10),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                            AppLocalizations
                                .of(context)
                                .Text_Goal_Price,
                            style:
                            TextStyle(
                              fontSize:
                              14,
                              fontFamily:
                              'Cairo-VariableFont_slnt',
                              color:
                              Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                            '  *  ',
                            style:
                            TextStyle(
                              fontSize:
                              14,
                              fontFamily:
                              'Montserrat-Bold',
                              color:
                              Colors.red.shade700,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: LayoutBuilder(
                builder: (context,
                    sizes) {
                  double w2 =
                      sizes.maxWidth;
                  double h2 =
                      sizes.maxHeight;
                  return Container(
                    // color: Colors.red,
                    child: Center(
                      child: Padding(
                        padding:
                        const EdgeInsets
                            .only(
                            right:
                            5,
                            left:
                            5),
                        child:
                        Container(
                          height: h2 /
                              1.3,
                          decoration:
                          BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(
                                5),
                            color: const Color(
                                0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                color:
                                Orange,
                                blurRadius:
                                1,
                                spreadRadius:
                                1,
                                offset:
                                const Offset(
                                  0.5,
                                  1,
                                ),
                              ),
                            ],
                          ),
                          child:
                          TextFormField(
                            textAlign:
                            TextAlign
                                .center,
                            style: TextStyle(
                                color: Colors
                                    .black,
                                fontSize: 14,
                                fontFamily:
                                'Seven-Segment'),
                            keyboardType:
                            TextInputType
                                .number,
                            decoration:
                            InputDecoration(
                              border:
                              InputBorder.none,
                              contentPadding: const EdgeInsets
                                  .all(
                                  2),
                              hintText:
                              AppLocalizations
                                  .of(context)
                                  .Text_Goal_Price,
                              hintStyle: TextStyle(
                                  color: Colors
                                      .grey.shade400,
                                  fontSize: 16,
                                  fontFamily: 'Cairo-VariableFont_slnt'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

// Widget gmail() {
//   return InkWell(
//     onTap: () {
//       setState(() {
//         selectedLanguage = 'Arabic';
//       });
//     },
//     child: Padding(
//       padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//       child: Container(
//         width: double.infinity,
//         height: 65,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//           border: Border(
//             left: BorderSide(color: Colors.grey.shade400),
//             right: BorderSide(color: Colors.grey.shade400),
//             top: BorderSide(color: Colors.grey.shade400),
//             bottom: BorderSide(color: Colors.grey.shade400),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Text(
//                       "eng_altaiypmohammed52@gmail.com",
//                       style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.grey.shade600,
//                         fontFamily: 'Montserrat-Regular',
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 8, right: 12, left: 12, bottom: 8),
//                     child: SvgPicture.asset('assets/icons/email.svg',
//                         fit: BoxFit.fill),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: 50,
//               height: double.infinity,
//               child: Center(
//                 child: Icon(
//                   Icons.chevron_right,
//                   size: 40,
//                   color: Colors.orangeAccent,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
}
