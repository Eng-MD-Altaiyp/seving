import 'package:flutter/material.dart';

class AppLanguageModel with ChangeNotifier {
  Locale _locale = Locale('en', 'US'); // Default language

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}