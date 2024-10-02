import 'package:flutter/material.dart';


import '../localization/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  final Function(Locale) setLocale;

  MyHomePage({required this.setLocale});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).Wellcome),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).Wellcome,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/secondPage');
              },
              child: Text(AppLocalizations.of(context).goodbye),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedLanguage,
              hint: Text(AppLocalizations.of(context).changeLanguage),
              onChanged: _changeLanguage,
              items: <String>['English', 'Arabic']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value == 'English'
                      ? AppLocalizations.of(context).english
                      : AppLocalizations.of(context).arabic
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}