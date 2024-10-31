import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phlox_animations/phlox_animations.dart';
import 'package:seving/localization/app_localizations.dart';
import 'Models/Models_And_Classes/Classes _and_barameters.dart';
import 'Models/Models_And_Classes/Colors.dart';
import 'Screens/User_Setting_Account/User_Setting_Account.dart';

class EndDrawers extends StatefulWidget {
  const EndDrawers({super.key});

  @override
  State<EndDrawers> createState() => _EndDrawersState();
}

class _EndDrawersState extends State<EndDrawers> {
  @override
  Widget build(BuildContext context) {
    return PhloxAnimations(
      duration: Duration(milliseconds: animation == true ? 700 : 250),
      fromOpacity: 0.1,
      fromX: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, right: 25,left: 25, bottom: 30),
        child: Container(
          // decoration: const BoxDecoration(boxShadow: []),
          child: Drawer(
            backgroundColor: background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            child: ListView(
              children: [
                DrawerHeader(
                  child: SizedBox(
                    width: ScreenWidth,
                    height: ScreenHeight,
                    child: LayoutBuilder(builder: (context, sizes) {
                      double w1 = sizes.maxWidth;
                      double h1 = sizes.maxHeight;
                      return Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: w1,
                              height: h1 / 1.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/app-bar-background-top.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: lang == 'English' ?Alignment.bottomLeft:Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 5.0,left: 5),
                                        child: Text(
                                          "مرحباً",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: lang == 'English' ?Alignment.bottomLeft:Alignment.bottomRight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0,left: 10),
                                        child: Text(
                                          User_Names.toString(),
                                          style: TextStyle(
                                            fontSize: ScreenWidth! / 28,
                                            color: Colors.white,
                                            fontFamily:
                                                'Cairo-VariableFont_slnt',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: lang == 'English' ?Alignment.bottomLeft:Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0,left: 10),
                                        child: Text(
                                          " ${User_Email}",
                                          style: TextStyle(
                                            fontSize: ScreenWidth! / 28,
                                            color: Colors.white,
                                            fontFamily: 'Cairo-VariableFont_slnt',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              onTap: () {
                                // showDialog(
                                //     barrierDismissible: false,
                                //     context: context,
                                //     builder: (BuildContext context) {
                                //       return User_Hero();
                                //     });
                              },
                              child: Container(
                                width: w1 / 3.4,
                                height: h1 / 1.7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    image: AssetImage(""),
                                    fit: BoxFit.fill,
                                  ),
                                  border: Border.all(
                                    color: primary300,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Divider(
                    color: Colors.black,
                    height: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/Settings');
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
                                    top: 5, right: 20, bottom: 5, left: 10),
                                child: Container(
                                  width: ScreenWidth! / 18,
                                  height: ScreenHeight! / 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: color1,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/setting.svg',
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
                              child: Text(
                                AppLocalizations.of(context).Settings,
                                style: TextStyle(
                                  fontSize: ScreenHeight! / 46,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo-VariableFont_slnt',
                                ),
                              ),
                            ),


                          ],
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

class Chenge_ip extends StatefulWidget {
  const Chenge_ip({super.key});

  @override
  State<Chenge_ip> createState() => _Chenge_ipState();
}

class _Chenge_ipState extends State<Chenge_ip> {
  final TextEditingController _beginning = TextEditingController();
  final TextEditingController _middle = TextEditingController();
  final TextEditingController _middle1 = TextEditingController();
  final TextEditingController _end = TextEditingController();

  bool ip_empty_beginning = false;
  bool ip_empty_middle = false;
  bool ip_empty_middle1 = false;
  bool ip_empty_end = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: ScreenHeight! / 2,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: PhloxAnimations(
                duration: const Duration(milliseconds: 150),
                fromOpacity: 0.1,
                fromScale: 0.5,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Chenge IP Connaction",
                          style: TextStyle(
                              fontFamily: 'Cairo-VariableFont_slnt',
                              fontSize: ScreenWidth! / 29,
                              color: text100),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 5),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ip_empty_beginning == false
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xD5E53232),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(
                                        0.5,
                                        1,
                                      ),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: _beginning,
                                  //  maxLength: 3,
                                  onChanged: (text) {
                                    setState(() {
                                      ip_empty_beginning = false;
                                      text =
                                          text.replaceAll(RegExp('[^0-9]'), '');
                                      int value = int.parse(_beginning.text);
                                      if (value >= 256 || text.length > 3) {
                                        _beginning.clear();
                                      }
                                    });
                                  },
                                  onSubmitted: (value) {
                                    setState(() {
                                      if (_end.text.isEmpty) {
                                        ip_empty_end = true;
                                      }
                                      if (_middle.text.isEmpty) {
                                        ip_empty_middle = true;
                                      }
                                      if (_middle1.text.isEmpty) {
                                        ip_empty_middle1 = true;
                                      }
                                      if (_beginning.text.isEmpty) {
                                        ip_empty_beginning = true;
                                      } else {
                                        ip_noempty_beginning = _beginning.text;
                                        ip_noempty_middle = _middle.text;
                                        ip_noempty_middle1 = _middle1.text;
                                        ip_noempty_end = _end.text;
                                        IP =
                                            "$ip_noempty_beginning.$ip_noempty_middle.$ip_noempty_middle1.$ip_noempty_end";
                                        DeviceIpAddress = IP;
                                        // IP_URL="http://$IP/PHP/Smart_Meter";
                                        Navigator.of(context).pop();
                                      }
                                    });
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(2),
                                    hintText: " 000 ",
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: ScreenWidth! / 20,
                                        fontFamily: 'Cairo-VariableFont_slnt'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Center(
                              child: Text(
                            ".",
                            style: TextStyle(
                              fontSize: 35,
                            ),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 5),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ip_empty_middle == false
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xD5E53232),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(
                                        0.5,
                                        1,
                                      ),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: _middle,
                                  //  maxLength: 3,
                                  onChanged: (text) {
                                    setState(() {
                                      ip_empty_middle = false;
                                      text =
                                          text.replaceAll(RegExp('[^0-9]'), '');
                                      int value = int.parse(_middle.text);
                                      if (value >= 256 || text.length > 3) {
                                        _middle.clear();
                                      }
                                    });
                                  },
                                  onSubmitted: (value) {
                                    setState(() {
                                      if (_end.text.isEmpty) {
                                        ip_empty_end = true;
                                      }
                                      if (_middle.text.isEmpty) {
                                        ip_empty_middle = true;
                                      }
                                      if (_middle1.text.isEmpty) {
                                        ip_empty_middle1 = true;
                                      }
                                      if (_beginning.text.isEmpty) {
                                        ip_empty_beginning = true;
                                      } else {
                                        ip_noempty_beginning = _beginning.text;
                                        ip_noempty_middle = _middle.text;
                                        ip_noempty_middle1 = _middle1.text;
                                        ip_noempty_end = _end.text;
                                        IP =
                                            "$ip_noempty_beginning.$ip_noempty_middle.$ip_noempty_middle1.$ip_noempty_end";
                                        DeviceIpAddress = IP;
                                        // IP_URL="http://$IP/PHP/Smart_Meter";
                                        Navigator.of(context).pop();
                                      }
                                    });
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(2),
                                    hintText: " 000 ",
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: ScreenWidth! / 20,
                                        fontFamily: 'Cairo-VariableFont_slnt'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Center(
                              child: Text(
                            ".",
                            style: TextStyle(
                              fontSize: 35,
                            ),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 5),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ip_empty_middle1 == false
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xD5E53232),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(
                                        0.5,
                                        1,
                                      ),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: _middle1,
                                  //  maxLength: 3,
                                  onChanged: (text) {
                                    setState(() {
                                      ip_empty_middle1 = false;
                                      text =
                                          text.replaceAll(RegExp('[^0-9]'), '');
                                      int value = int.parse(_middle1.text);
                                      if (value >= 256 || text.length > 3) {
                                        _middle1.clear();
                                      }
                                    });
                                  },
                                  onSubmitted: (value) {
                                    setState(() {
                                      if (_end.text.isEmpty) {
                                        ip_empty_end = true;
                                      }
                                      if (_middle.text.isEmpty) {
                                        ip_empty_middle = true;
                                      }
                                      if (_middle1.text.isEmpty) {
                                        ip_empty_middle1 = true;
                                      }
                                      if (_beginning.text.isEmpty) {
                                        ip_empty_beginning = true;
                                      } else {
                                        ip_noempty_beginning = _beginning.text;
                                        ip_noempty_middle = _middle.text;
                                        ip_noempty_middle1 = _middle1.text;
                                        ip_noempty_end = _end.text;
                                        IP =
                                            "$ip_noempty_beginning.$ip_noempty_middle.$ip_noempty_middle1.$ip_noempty_end";
                                        DeviceIpAddress = IP;

                                        // IP_URL="http://$IP/PHP/Smart_Meter";
                                        Navigator.of(context).pop();
                                      }
                                    });
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(2),
                                    hintText: " 000 ",
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: ScreenWidth! / 20,
                                        fontFamily: 'Cairo-VariableFont_slnt'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Center(
                              child: Text(
                            ".",
                            style: TextStyle(
                              fontSize: 35,
                            ),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 5),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ip_empty_end == false
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xD5E53232),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(
                                        0.5,
                                        1,
                                      ),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: _end,
                                  //  maxLength: 3,
                                  onChanged: (text) {
                                    setState(() {
                                      ip_empty_end = false;
                                      text =
                                          text.replaceAll(RegExp('[^0-9]'), '');
                                      int value = int.parse(_end.text);
                                      if (value >= 256 || text.length > 3) {
                                        _end.clear();
                                      }
                                    });
                                  },
                                  onSubmitted: (value) {
                                    setState(() {
                                      if (_end.text.isEmpty) {
                                        ip_empty_end = true;
                                      }
                                      if (_middle.text.isEmpty) {
                                        ip_empty_middle = true;
                                      }
                                      if (_middle1.text.isEmpty) {
                                        ip_empty_middle1 = true;
                                      }
                                      if (_beginning.text.isEmpty) {
                                        ip_empty_beginning = true;
                                      } else {
                                        ip_noempty_beginning = _beginning.text;
                                        ip_noempty_middle = _middle.text;
                                        ip_noempty_middle1 = _middle1.text;
                                        ip_noempty_end = _end.text;
                                        IP =
                                            "$ip_noempty_beginning.$ip_noempty_middle.$ip_noempty_middle1.$ip_noempty_end";
                                        // IP_URL="http://$IP/PHP/Smart_Meter";

                                        DeviceIpAddress = IP;
                                        Navigator.of(context).pop();
                                      }
                                    });
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(2),
                                    hintText: " 000 ",
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: ScreenWidth! / 20,
                                        fontFamily: 'Cairo-VariableFont_slnt'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 30),
                                child: InkWell(
                                  onTap: () {
                                    _end.clear();
                                    _middle.clear();
                                    _middle1.clear();
                                    _beginning.clear();
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/app-bar-background-top.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFFFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                          offset: const Offset(
                                            0.5,
                                            1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Clear",
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
                                    const EdgeInsets.only(right: 30, left: 20),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (_end.text.isEmpty) {
                                        ip_empty_end = true;
                                      }
                                      if (_middle.text.isEmpty) {
                                        ip_empty_middle = true;
                                      }
                                      if (_middle1.text.isEmpty) {
                                        ip_empty_middle1 = true;
                                      }
                                      if (_beginning.text.isEmpty) {
                                        ip_empty_beginning = true;
                                      } else {
                                        ip_noempty_beginning = _beginning.text;
                                        ip_noempty_middle = _middle.text;
                                        ip_noempty_middle1 = _middle1.text;
                                        ip_noempty_end = _end.text;
                                        IP =
                                            "$ip_noempty_beginning.$ip_noempty_middle.$ip_noempty_middle1.$ip_noempty_end";
                                        // IP_URL="http://$IP/PHP/Smart_Meter";
                                        DeviceIpAddress = IP;
                                        Navigator.of(context).pop();
                                        print(IP);
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      //color: accent200,
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/app-bar-background-top.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFFFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                          offset: const Offset(
                                            0.5,
                                            1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Submet",
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
                        color: primary300,
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
}
