import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Models/Models_And_Classes/Classes _and_barameters.dart';
import '../../Models/Models_And_Classes/Colors.dart';
import '../../Navigetor_Pages.dart';
import '';
import '../../localization/app_localizations.dart';

class Settings_Account extends StatefulWidget {
  final Function(Locale) setLocale;

  Settings_Account({Key? key, required this.setLocale}) : super(key: key);

  @override
  State<Settings_Account> createState() => _Settings_AccountState();
}

class _Settings_AccountState extends State<Settings_Account> {
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        flexibleSpace: Image.asset(
          'assets/images/app-bar-background-top.png',
          fit: BoxFit.fill,
        ),
        title: Text(
          AppLocalizations.of(context).Settings,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Cairo-VariableFont_slnt',
          ),
        ),
        leading: Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10, bottom: 10, right: 15, left: 15),
            child: InkWell(
              onTap: () {
                setState(() {
                  // indexz=0;
                  Navigator.of(context).pop();
                });
              },
              child: Container(
                width: 50,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(
                          selectedLanguage == 'English' ? 1.0 : -1.0, 1.0),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-right.svg',
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: background,
        child: Column(
          children: [
            Padding(
              padding:
              EdgeInsets.only(top: 30, right: 15, left: 15, bottom: 5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    // _setLocale(locale_g);
                    showModalBottomSheet(
                      isScrollControlled: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) =>
                          showbotton(setLocale: widget.setLocale),
                    );
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(
                          -0.5,
                          -1,
                        ),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(
                          0.5,
                          1,
                        ),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Text(
                          AppLocalizations.of(context).The_Language,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Montserrat-Regular',
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "$lang",
                              style:
                              TextStyle(fontSize: 18, color: accent200),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: color2p,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    // _setLocale(locale_g);
                    // showModalBottomSheet(
                    //   isScrollControlled: false,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   backgroundColor: Colors.transparent,
                    //   context: context,
                    //   builder: (context) =>
                    //       showbotton(setLocale: widget.setLocale),
                    // );
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Text(
                          AppLocalizations.of(context).privacy,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Montserrat-Regular',
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.chevron_right,
                          color: color2p,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    // _setLocale(locale_g);
                    // showModalBottomSheet(
                    //   isScrollControlled: false,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   backgroundColor: Colors.transparent,
                    //   context: context,
                    //   builder: (context) =>
                    //       showbotton(setLocale: widget.setLocale),
                    // );
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Text(
                          AppLocalizations.of(context).terms,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Montserrat-Regular',
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.chevron_right,
                          color: color2p,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    // _setLocale(locale_g);
                    showModalBottomSheet(
                      isScrollControlled: false,
                      isDismissible: false,
                        enableDrag: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Delete_out(named: 'sign out'),
                    );
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Text(
                          AppLocalizations.of(context).signout,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Montserrat-Regular',
                            color: red_error,
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.chevron_right,
                          color: color2p,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 5),
              child: InkWell(
                onTap: () {
                  setState(() {
                    showModalBottomSheet(
                      isScrollControlled: false,
                      isDismissible: false,
                        enableDrag: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => Delete_out(named: 'delete'),
                    );
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Text(
                          AppLocalizations.of(context).delete,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Montserrat-Regular',
                            color: red_error,
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.chevron_right,
                          color: color2p,
                          size: 40,
                        ),
                      ),
                    ],
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

class showbotton extends StatefulWidget {
  final Function(Locale) setLocale;

  const showbotton({Key? key, required this.setLocale}) : super(key: key);

  @override
  State<showbotton> createState() => _showbottonState();
}

class _showbottonState extends State<showbotton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 340,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: double.infinity,
              height: 325,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(top: BorderSide(width: 3,color: Blue_app,),),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Text(
                              AppLocalizations.of(context).App_Laung,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade800,
                                fontFamily: 'Montserrat-Regular',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/icons/cancel-svgrepo-com.svg',
                              // weight: 40,
                              width: 30,
                              color: On_Of_color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedLanguage = 'Arabic';
                      });
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border: selectedLanguage == 'Arabic'
                              ? Border.all(color: Blue_app, width: 1)
                              : Border.all(color: Colors.transparent, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Blue_Border,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/images/arabic.webp',),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      AppLocalizations.of(context).arabic,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50,
                              height: double.infinity,
                              child: Center(
                                child: selectedLanguage == 'Arabic'
                                    ? Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: On_Of_color,
                                        ),
                                        child: Center(
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: On_Of_color,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.white,
                                              ),
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedLanguage = 'English';
                      });
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border: selectedLanguage == 'English'
                              ? Border.all(color: Blue_app, width: 1)
                              : Border.all(color: Colors.transparent, width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Blue_Border,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/images/english.png',),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      AppLocalizations.of(context).english,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50,
                              height: double.infinity,
                              child: Center(
                                child: selectedLanguage == 'English'
                                    ? Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: On_Of_color,
                                        ),
                                        child: Center(
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: On_Of_color,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.white,
                                              ),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (lang != selectedLanguage) {
                            lang = selectedLanguage;
                            _changeLanguage(selectedLanguage);
                            Navigator.of(context).pop();
                            // Navigator.pushNamed(context, '/Settings');
                          }
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: lang != selectedLanguage
                              ? Orange
                              : Lunguage_Buttom,
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).Save,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // void setLocale(Locale locale) {
  //   setState(() {
  //     locale_g = locale;
  //   });
  // }
  String _selectedLanguage = 'English';

  _changeLanguage(String? language) {
    setState(() {
      _selectedLanguage = language!;
      switch (language) {
        case 'English':
          widget.setLocale(Locale('en', 'US'));
          break;
        case 'Arabic':
          widget.setLocale(Locale('ar', 'SA'));
          break;
        default:
          break;
      }
    });
  }
}

class Delete_out extends StatefulWidget {
  final String named;

  const Delete_out({super.key, required this.named});

  @override
  State<Delete_out> createState() => _Delete_outState();
}

class _Delete_outState extends State<Delete_out> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 340,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(top: BorderSide(width: 3,color: delete2,),),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      child: Center(
                        child: Container(
                          height: 80,
                          width: 80,
                          child: Center(
                            child: SvgPicture.asset(
                              widget.named == 'delete'
                                  ? 'assets/icons/trash.svg'
                                  : 'assets/icons/logout.svg',
                              width: 30,
                              color: red_error,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: delete,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        widget.named == 'delete'
                            ? AppLocalizations.of(context).delete
                            : AppLocalizations.of(context).signout,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade700,
                          fontFamily: 'Montserrat-Regular',
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          widget.named == 'delete'
                              ? AppLocalizations.of(context).delete_subtitle1
                              : AppLocalizations.of(context).out_subtitle1,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.grey.shade500,
                            fontFamily: 'Montserrat-Regular',
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          widget.named == 'delete'
                              ? AppLocalizations.of(context).delete_subtitle2
                              : AppLocalizations.of(context).out_subtitle2,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.grey.shade500,
                            fontFamily: 'Montserrat-Regular',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
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
                                          widget.named == 'delete'
                                              ? AppLocalizations.of(context)
                                                  .delete
                                              : AppLocalizations.of(context)
                                                  .signout,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontFamily: 'Montserrat-Regular',
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: delete2,
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
                                      onTap: ()
                                      {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            AppLocalizations.of(context).Cancel,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'Montserrat-Regular',
                                            ),
                                          ),
                                        ),

                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
