import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seving/Models/Models_And_Classes/Colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../localization/app_localizations.dart';
import '../../Models/Models_And_Classes/Classes _and_barameters.dart';

class support extends StatefulWidget {
  const support({Key? key}) : super(key: key);

  @override
  State<support> createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 90,
              // height: sizes / 98,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  border: Border(top: BorderSide(width: 3,color: green_god,),),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: Container(
                          child: Text(
                            AppLocalizations.of(context).Support_title,
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
                            AppLocalizations.of(context).Support_subtitle2,
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
                            AppLocalizations.of(context).WhatsApp_Serves,
                            'whtasapp1','505585434787'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {},
                        child: connecation(
                            green_god,
                            'assets/icons/whatsapp-2.svg',
                            AppLocalizations.of(context).WhatsApp_Serves,
                            'whtasapp2','505585434787'),
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
                            'gmail','0'),
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
                            'call','505585434787'),
                      ),
                    ),
                    // Expanded(
                    //   flex: 2,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: gmail(),
                    //   ),
                    // ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 20, right: 20),
                        child: Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/twitter.svg',
                                          color: Blue_app_op,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/instagram.svg',
                                          color: Blue_app_op,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/facebook.svg',
                                          color: Blue_app_op,
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
          )
        ],
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
  Widget connecation(Color color, String Image, String text, var Page, String Phone) {
    // Uri _url = Uri.parse(Page.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: InkWell(
        onTap: () {
          // Page
          if(Page == 'gmail')
          {
            final Uri uri = Uri(
              scheme: 'http',
              path:
              "$text",
            );
            _luanchurl(uri);          }
          if(Page == 'call')
          {
            final Uri uri = Uri(
              scheme: 'tel',
              path:
              "$Phone",
            );
            _luanchurl(uri);
          }
          if(Page == 'whtasapp1')
            {setState(() {
              launchwhatsapp(
                  Phone,
                  'السلام عليكم ورحمة الله وبركاته');
            });
            }

          if(Page == 'whtasapp2')
          {
            launchwhatsapp(
                Phone,
                'السلام عليكم ورحمة الله وبركاته');
          }
        },
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: LayoutBuilder(builder: (context, sizes) {
            double w1 = sizes.maxWidth;
            double h1 = sizes.maxHeight;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        child: Container(
                          height: h1,
                          width: w1 / 7,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: SvgPicture.asset(
                            Image,
                            color: color == green_god?Colors.white:Blue_app_op,
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(
                            color: Blue_Border,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 15,color: color == green_god?Colors.white:Colors.black,
                            fontFamily: 'Montserrat-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: double.infinity,
                  child: Center(
                    child: Icon(
                      Icons.chevron_right,
                      size: 40,
                      color: color2p,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
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
