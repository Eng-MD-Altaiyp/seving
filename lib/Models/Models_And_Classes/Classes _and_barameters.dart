import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

import '../../Databease/DataBase_Functions.dart';

//
//    Responsive for all screen   ==================================================




double? ScreenWidth;
double? ScreenHeight;

//----------------------------------------------------

DataBase_Metter data_metter = DataBase_Metter();

String selectedLanguage = 'English';
// String chenglanguage = selectedLanguage;
String lang = selectedLanguage!;
String Passs = '';
Locale locale_g = const Locale('en', 'US'); // Default language
double sizes = 493;
// real Time Animations  ==================================================
bool animation = true;





// From  a Server  ==================================================
double All_Consumption = 0.0;
double For_Start_Open = 0.0;
double Added_Read = 0;
var Response_Real_Time;

// DataBase_Metter data_metter = DataBase_Metter();

String API = "api";
bool Check_Response_On_Server = false;
bool Check_Response_On_Server_Or_Sql = false;
bool CheckServerOnOrOff = false;
String DeviceIpAddress = IP;
int KilowattPrice = 0;
int MaxConsumption = 0;
int SubscriptionPrice = 0;
int DiscountPrice = 0;
int TimeToRead = 1;
double WattPrice = KilowattPrice / 1000;



/*
*   "DeviceIpAddress": "152.178.0.1",
    "KilowattPrice": 300,
    "SubscriptionPrice": 32,
    "IsItOnOrOff": true,
    "TimeToRead": 1
    * */

//----------------------------------------------------

//-------------------------------   Flutter Info ( Version app )
String Version_Info = "1.0.0";

//Server Ip Addresse ==================================================
int Counter_Notifications = 0;

double Max_Value = 0;
double Min_Value = 0;
List<double> Add_value = [];

List<double> data_consump =[];

String ip_noempty_beginning = "0";
String ip_noempty_middle = "0";
String ip_noempty_middle1 = "0";
String ip_noempty_end = "0";
String Port = "8000";

// 192.168.43.132
//   192.168.1.109    wifi
//   192.168.42.68    cable
//  192.168.1.104
//192.168.0.127
//192.168.149.1

String IP = "$ip_noempty_beginning.$ip_noempty_middle.$ip_noempty_middle1.$ip_noempty_end";

//http://localhost/Laravel/Smart_Meter_Simulation_New/routes/api.php
// 192.168.0.127
// 192.168.1.104
// String IP_URL="http://$DeviceIpAddress:$Port/api";

//----------------------------------------------------
// Charts Baramiters  ==================================================

DateTime selectedDate = DateTime.now();
int Month_now = 1;
int Year_now = 2024;
int Day_now = 1;
int Now_Houres = 0;
int Type_Statistics = 1;
double top = 0;

List<int> Temp_Index = [];

List<int> Day_31 = [
  // 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,
];
List<int> Temp_Data = [];
List<int> Day_Index_Popup = [];

///----------------------------------------------------

/// Navegitor Page And Charts ==================================================

double? width;
String navegitor = 'home';
int IndexPage = 3;
int IndexPlan = 0;
String IndexPlan_n = 'd';
int notifications = 4;
int Index_Settings = 0;

////----------------------------------------------------

bool add_bills = false;




String? User_Email;
// bool? Repeat;
String? User_Names;