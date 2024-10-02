import 'package:flutter/material.dart';

import '../Models/Models_And_Classes/Classes _and_barameters.dart';

class AppLocalizations {
  static  LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get Wellcome => locale.languageCode == 'en' ? 'Welcome Back in': 'مرحبا بك في';
  //login titles
  String get logindiscrption => locale.languageCode == 'en' ? 'Please enter your login details.': 'الرجاء ادخال بياناتك';
  String get phonenumber => locale.languageCode == 'en' ? 'Phone Number' : 'رقم الهاتف';
  String get enphonenumber => locale.languageCode == 'en' ? 'Enter Phone Number' : 'ادخل رقم الهاتف';
  String get password => locale.languageCode == 'en' ? 'Password' : 'كلمة المرور';
  String get enpassword => locale.languageCode == 'en' ? 'Enter Password' : 'ادخل كلمة المرور';
  String get login => locale.languageCode == 'en' ? 'login' : 'تسجيل الدخول';
  String get forgetpass => locale.languageCode == 'en' ? 'Forget Password?' : 'نسيت كلمة المرور';
  String get orcontinuewith  => locale.languageCode == 'en' ? 'or continue with ' : 'او الاستمرار مع';
  String get noaccount => locale.languageCode == 'en' ? 'Didn`t have an account?' : 'ليس لديك حساب؟';
  //sign up
  String get signup => locale.languageCode == 'en' ? 'Sign up' : 'تسجيل';
  String get or_with => locale.languageCode == 'en' ? 'Or Continuo With' : 'أو الاستمرار مع';
  String get small_data_sign_up => locale.languageCode == 'en' ? 'Sign up Account' : 'قم بالتسجيل في الحساب';
  String get to => locale.languageCode == 'en' ? 'to' : 'على';
  String get already_have_account => locale.languageCode == 'en' ? 'Already have an account? ' : 'هل لديك حساب بالفعل؟ ';
  String get Policy1 => locale.languageCode == 'en' ? 'I agree to the ' : 'أنا أوافق على';
  String get Policy2 => locale.languageCode == 'en' ? 'Terms & Conditions & Privacy Policy' : 'الشروط والأحكام وسياسة الخصوصية';
  String get enter_details => locale.languageCode == 'en' ? 'Please enter your sign in details.' : 'الرجاء إدخال تفاصيل تسجيل الدخول الخاصة بك.';
  String get cpassword => locale.languageCode == 'en' ? 'Confirm Password' : 'تأكيد كلمة المرور';
  String get lname => locale.languageCode == 'en' ? 'Enter Last Name' : 'أدخل الاسم الأخير';
  String get fname => locale.languageCode == 'en' ? 'Enter First Name' : 'أدخل الاسم الأول';
  String get phone => locale.languageCode == 'en' ? 'Enter Phone Number' : 'أدخل رقم الهاتف';
  String get config => locale.languageCode == 'en' ? 'Confirm The Password' : 'تأكيد كلمة المرور';
  String get email => locale.languageCode == 'en' ? 'Enter Your Email' : 'أدخل ايميلك';
  String get logo_name => locale.languageCode == 'en' ? 'CryptoFeast' : 'CryptoFeast';
  String get Forgot => locale.languageCode == 'en' ? 'Forgot your password' : 'نسيت كلمة السر';
  String get User_Name => locale.languageCode == 'en' ? 'Hello $User_Names' : 'مرحباً $User_Names';

  //
  String get send => locale.languageCode == 'en' ? 'send' : 'ارسال';
  String get goodbye => locale.languageCode == 'en' ? 'Goodbye' : 'مع السلامة';
  String get changeLanguage => locale.languageCode == 'en' ? 'Change Language' : 'تغيير اللغة';
  String get english => locale.languageCode == 'en' ? 'English' : 'الإنجليزية';
  String get arabic => locale.languageCode == 'en' ? 'Arabic' : 'العربية';


  // Home Page App Bar


  // String get Names_Catagories {
  //   String langCode = locale.languageCode;
  //   return names_Catagories.first[langCode] ?? 'Fruits';
  // }

  // Home Page
  String get Remaining => locale.languageCode == 'en' ? 'Remaining to reach the goal' : 'المتبقي للوصول الى الاهدف';
  String get Remaining1 => locale.languageCode == 'en' ? 'The remaining amount' : 'المبلغ المتبقي';
  String get Seved => locale.languageCode == 'en' ? 'Saving ' : 'المدخر';
  String get Added_Succ => locale.languageCode == 'en' ? 'Payment was made successfully ' : 'تم السداد بنجاح';
  String get Required => locale.languageCode == 'en' ? 'Required amount' : 'المبلغ المطلوب';
  String get Counter => locale.languageCode == 'en' ? 'Number of goals' : 'عدد الاهداف';
  String get Expected => locale.languageCode == 'en' ? 'Expected date' : 'الشهر المتوقع';
  String get Complate1 => locale.languageCode == 'en' ? 'You have completed ' : 'لقد اكملت ';
  String get Complate2 => locale.languageCode == 'en' ? ' of your goal' : ' من هدفك';
  String get BuyCar => locale.languageCode == 'en' ? 'Buy Car' : 'شراء سيارة';
  String get Amount_paid => locale.languageCode == 'en' ? 'Amount paid' : 'المبلغ المدفوع';
  String get Favorite_List => locale.languageCode == 'en' ? 'Favorite List' : 'قائمة المفضلة';



  // Add Goals
  String get add_goal_butom => locale.languageCode == 'en' ? 'Add Goal' : 'أضاف الهدف';
  String get add_goals => locale.languageCode == 'en' ? 'Add Goals' : 'إضافة الاهداف';
  String get Text_Goal_Price => locale.languageCode == 'en' ? "Goal's Price" : 'سعر الهدف';
  String get Text_Goal_Name => locale.languageCode == 'en' ? 'Goal Name' : 'اسم الهدف';
  String get choce_goal => locale.languageCode == 'en' ? 'Chose Goal' : 'اختر الهدف';
  String get Start_Date => locale.languageCode == 'en' ? 'Chose Date For Start' : 'اختر تاريخ البداء';
  String get Monthly_payment => locale.languageCode == 'en' ? 'Monthly payment' : 'السداد الشهري';
  String get goal_type => locale.languageCode == 'en' ? 'Target type' : 'نوع الهدف';
  String get BuyMotorbike => locale.languageCode == 'en' ? 'Buy Motorbike' : 'شراء دراجة نارية';
  String get BuyPhone => locale.languageCode == 'en' ? 'Buy Phone' : 'شراء هاتف';
  String get BuyTruck => locale.languageCode == 'en' ? 'Buy Truck' : 'شراء شاحنة';
  String get Ok_Date => locale.languageCode == 'en' ? 'Done' : 'تم';
  String get Start_date => locale.languageCode == 'en' ? 'Date of beginning' : 'تاريخ البداء';
  String get Confirm_saving => locale.languageCode == 'en' ? 'Confirm Saving' : 'تأكيد الحفظ';
  String get Added => locale.languageCode == 'en' ? 'Target added' : 'تم أضافة الهدف';
  String get Exists => locale.languageCode == 'en' ? 'The target you entered already exists' : 'الهدف الذي ادخلته موجود مسبقاً';
  String get Date_Error => locale.languageCode == 'en' ? "Make sure the date cannot be less than today's date" : 'تأكد من التاريخ لا يمكن ان يمون اقل من تاريخ اليوم';



  // User & Settings
  String get User_About => locale.languageCode == 'en' ? 'About the User' : 'عن المستخدم';
  String get Other_settings => locale.languageCode == 'en' ? 'Others' : 'اخرى';
  String get Settings => locale.languageCode == 'en' ? "Settings":"ألإعدادات";
  String get Setting_subtitle => locale.languageCode == 'en' ? "Language, privacy policy, appearance":"اللغة وسياسة الخصوصية والمظهر";
  String get The_Language => locale.languageCode == 'en' ? "Language":"اللغة";
  String get Save => locale.languageCode == 'en' ? "Save":"حفظ";
  String get privacy => locale.languageCode == 'en' ? "Privacy policy":"سياسة الخصوصية";
  String get terms => locale.languageCode == 'en' ? "Terms and conditions":"الشروط والاحكام";
  String get signout => locale.languageCode == 'en' ? "sign out":"تسجيل الخروج";
  String get out_subtitle1 => locale.languageCode == 'en' ? "Do you really want to sign out":"هل تريد حقا تسجيل الخروج";
  String get out_subtitle2 => locale.languageCode == 'en' ? "We hope you'll be back soon":"نأمل أن تعود قريباً";
  String get delete => locale.languageCode == 'en' ? "Delete account":"حذف الحساب";
  String get delete_subtitle1 => locale.languageCode == 'en' ? "Do you really want to delete your account?":"هل تريد حقا حذف حسابك؟";
  String get delete_subtitle2 => locale.languageCode == 'en' ? "You will lose your data":"سوف تفقد البيانات الخاصة بك";
  String get App_Laung => locale.languageCode == 'en' ? "Application launguage":"لغة التطبيق";
  String get Cancel => locale.languageCode == 'en' ? "Cancel":"إلغاء";

  String get Support_title => locale.languageCode == 'en' ? "Technical support":"الدعم الفني";
  String get Support_subtitle => locale.languageCode == 'en' ? "Contact the technical support team":"اتصل بفريق الدعم الفني";
  String get Support_subtitle2 => locale.languageCode == 'en' ? "You can contact us in the following ways":"يمكنك التواصل معنا بأحد الطرق التالية";

  String get About_title => locale.languageCode == 'en' ? "About the application":"عن التطبيق";
  String get About_subtitle => locale.languageCode == 'en' ? "Data of the team that owns the application":" بيانات الفريق المالك للتطبيق";

  String get Developer_title => locale.languageCode == 'en' ? "Application developer":"مطور التطبيقات";
  String get Developer_subtitle => locale.languageCode == 'en' ? "Learn about the team that developed the application":"تعرف على الفريق المطورة للتطبيق";

  String get Update_title => locale.languageCode == 'en' ? "updates":"التحديثات";

  String get WhatsApp_Serves => locale.languageCode == 'en' ? "WhatsApp customer service":"خدمة العملاء واتساب";
// String get Email => locale.languageCode == 'en' ? "updates":"التحديثات";
// String get Phone => locale.languageCode == 'en' ? "updates":"التحديثات";
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}