// import 'dart:convert';
// import 'dart:math';
// import 'package:http/http.dart' as http;
//
// import '../Models_And_Classes/Classes _and_barameters.dart';
//
// class Get_Response_Server {
//   Future<dynamic> ON_OF_SERVER() async {
//     var dataResponseOnOffServer;
//     // print('============================TTTTTTTTTTTTTTTTTTTTTT ====================== ${DeviceIpAddress}');
//     try {
//       var responseOnOffServer = await http
//           .get(
//               Uri.parse('http://$DeviceIpAddress:$Port/${API}/CheckServerOnOrOff'))
//           .timeout(const Duration(seconds: 5), onTimeout: () {
//         // CheckServerOnOrOff = true;
//         return http.Response('Error', 500);
//       });
//
//       dataResponseOnOffServer = json.decode(responseOnOffServer.body);
//       if (responseOnOffServer.statusCode == 200) {
//         // check_server.Check_Response();
//         Check_Response_On_Server = true;
//         if (dataResponseOnOffServer['message'] == "The Server Is Turned Off") {
//           CheckServerOnOrOff = false;
//         } else {
//           // Cgack_Server_In_App = true;
//           CheckServerOnOrOff = true;
//         }
//         Function_SqFlite.OnLine_Set_Configration();
//         Get_All_Response_Real_Time();
//       }
//     } catch (error) {
//       // this code Fallow Get_All_Response_Real_Time Function
//       // CheckServerOnOrOff = false;
//       Function_SqFlite.Chack_Data_For_Real_Time('set');
//       // Function_SqFlite.OffLine_Get_Configration();
//       Check_Response_On_Server = false;
//       // CheckServerOnOrOff = true;
//     }
//
//     print("Check Server On Or Off     ::::     $CheckServerOnOrOff");
//   }
//
//   Future Get_All_Response_Real_Time() async {
//     try {
//       var url = "http://$DeviceIpAddress:$Port/${API}/RealTimeReads";
//       final response = await http
//           .get(
//         Uri.parse(url),
//       )
//           .timeout(const Duration(seconds: 5), onTimeout: () {
//         // CheckServerOnOrOff = true;
//         return http.Response('Error', 500);
//       });
//       if (response.statusCode == 200) {
//         Response_Real_Time = json.decode(response.body);
//         For_Start_Open = Response_Real_Time[0];
//         Added_Read = double.parse(Response_Real_Time[1].toString()) / 1000;
//         All_Consumption = For_Start_Open.toDouble() + Added_Read.toDouble();
//         print(
//             '=================== For_Start_Open ==== $For_Start_Open  ===== Added_Read ==== $Added_Read  ===== All_Consumption ==== $All_Consumption');
//         List<Map> readData = await data_metter.readData("""
//           SELECT * FROM 'RealTimeReads_Table'
//       """);
//         if (readData.isEmpty) {
//           Function_SqFlite.Chack_Data_For_Real_Time('set');
//           print(
//               "Read_Data OnLine ===========  RealTimeReads_Table  =========== $readData");
//         } else if (readData.isNotEmpty) {
//           int updateD = await data_metter.updateData("""
//       UPDATE  'RealTimeReads_Table' SET
//        'Real_Time_Read' = ${All_Consumption.toDouble()},
//        'Added_To_Real_Time' = ${Added_Read.toDouble()}
//         WHERE Real_Time_id = ${1.toInt()}
//       """);
//           print(
//               'update_d OnLine ===========  RealTimeReads_Table  =========== $updateD');
//         }
//         // print("${Response_Real_Time[1]}  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//       }
//       Check_Response_On_Server_Or_Sql = false;
//     } catch (Error) {
//       Function_SqFlite.Chack_Data_For_Real_Time('set');
//     }
//     // Response_Real_Time[0];
//   }
// }
//
// SqFlite_Functions Function_SqFlite = SqFlite_Functions();
//
// class SqFlite_Functions {
//   // this function checks the "Configration Data" with previously stored data and updates it.
//   Future<dynamic> OnLine_Set_Configration() async {
//     var dataResponseDataConfiguration;
//
//     try {
//       final responseDataConfiguration = await http
//           .get(Uri.parse('http://$DeviceIpAddress:$Port/${API}/GetConfiguration'))
//           .timeout(const Duration(seconds: 5), onTimeout: () {
//         // CheckServerOnOrOff = true;
//         return http.Response('Error', 500);
//       });
//       dataResponseDataConfiguration =
//           json.decode(responseDataConfiguration.body);
//       if (responseDataConfiguration.statusCode == 200) {
//         DeviceIpAddress = dataResponseDataConfiguration['DeviceIpAddress'];
//         KilowattPrice = dataResponseDataConfiguration['KilowattPrice'];
//         MaxConsumption = dataResponseDataConfiguration['MaxConsumption'];
//         SubscriptionPrice = dataResponseDataConfiguration['SubscriptionPrice'];
//         // DiscountPrice = dataResponseDataConfiguration['DiscountPrice'];
//         TimeToRead = dataResponseDataConfiguration['TimeToRead'];
//         Configuration_Data();
//       }
//     } catch (Error) {
//       // OffLine_Get_Configration();
//     }
//   }
//
//   Configuration_Data() async {
//     try{
//       int updateD = await data_metter.updateData("""
//       UPDATE  'Configrations_Metter' SET
//        'DeviceIpAddress' = '${DeviceIpAddress.toString()}',
//        'API' = '${API.toString()}',
//        'CheckServerOnOrOff' = '${CheckServerOnOrOff}',
//         'KilowattPrice' = '${KilowattPrice.toInt()}',
//         'MaxConsumption' = '${MaxConsumption.toInt()}',
//          'DiscountPrice' = '${DiscountPrice.toInt()}',
//         'SubscriptionPrice' = '${SubscriptionPrice.toInt()}',
//         'TimeToRead' = '${TimeToRead.toInt()}'
//         WHERE Config_id = ${1.toInt()}
//       """);
//       print("update_d Onn =================================== $updateD");
//     }
//     catch(Erorr)
//     {
//       print('    -----  Error ----- ${Erorr}');
//     }
//   }
//
//   // this function extracts the "Configration data" from the database in which it is stored in the event that the application is not connected to the Metter or Server.
//   OffLine_Get_Configration() async {
//
//     var readData = await data_metter.readData("""
//           SELECT * FROM 'Configrations_Metter'
//           LIMIT 1
//       """);
//     if (readData.isEmpty) {
//       int insertD = await data_metter.insertData("""
//       INSERT INTO 'Configrations_Metter' ('DeviceIpAddress','API','CheckServerOnOrOff','KilowattPrice','MaxConsumption','SubscriptionPrice','DiscountPrice','TimeToRead')
//       VALUES ('$DeviceIpAddress','${CheckServerOnOrOff}','$API','${KilowattPrice.toInt()}','${MaxConsumption.toInt()}','${SubscriptionPrice.toInt()}','${DiscountPrice.toInt()}','${TimeToRead.toInt()}')
//       """);
//       print("insert_d Off =================================== $insertD");
//     } else if (readData.isNotEmpty) {
//       Map<String, dynamic> ConfigData = readData.first;
//       DeviceIpAddress = ConfigData['DeviceIpAddress'];
//       API = ConfigData['API'];
//       CheckServerOnOrOff =  bool.parse(ConfigData['CheckServerOnOrOff']);
//       KilowattPrice = ConfigData['KilowattPrice'];
//       MaxConsumption = ConfigData['MaxConsumption'];
//       SubscriptionPrice = ConfigData['SubscriptionPrice'];
//       DiscountPrice = ConfigData['DiscountPrice'];
//       TimeToRead = ConfigData['TimeToRead'];
//
//       // for (var element in readData) {
//       //   element.forEach((key, value) {
//       //     if (key.toString() == 'DeviceIpAddress') {
//       //       DeviceIpAddress = value.toString();
//       //     } else if (key.toString() == 'CheckServerOnOrOff') {
//       //       CheckServerOnOrOff = value;
//       //     } else if (key.toString() == 'KilowattPrice') {
//       //       KilowattPrice = value;
//       //     } else if (key.toString() == 'MaxConsumption') {
//       //       MaxConsumption = value;
//       //     } else if (key.toString() == 'SubscriptionPrice') {
//       //       SubscriptionPrice = value;
//       //     } else if (key.toString() == 'DiscountPrice') {
//       //       print(
//       //           '==================================== ${value} =================================== ${value.runtimeType}');
//       //       DiscountPrice = value;
//       //     } else if (key.toString() == 'TimeToRead') TimeToRead = value;
//       //   });
//       //   print(
//       //       "Get Off =================================== $DeviceIpAddress== $KilowattPrice== $MaxConsumption== $SubscriptionPrice ==$DiscountPrice ");
//       // }
//     }
//     Get_Response_Server fun = Get_Response_Server();
//     fun.ON_OF_SERVER();
//
//     print("Read_Data Off =================================== $readData");
//   }
//
//   Chack_Data_For_Real_Time(String task) async {
//     if (task == 'update') {
//       int updateD = await data_metter.updateData("""
//       UPDATE 'RealTimeReads_Table' SET
//        'Real_Time_Read' = ${All_Consumption.toDouble()},
//        'Added_To_Real_Time' = ${Added_Read.toDouble()}
//         WHERE Real_Time_id = ${1.toInt()}
//       """);
//       print(
//           '===========  RealTimeReads_Table  =========== $updateD ==== ${All_Consumption.toDouble()}');
//     } else if (task == 'set') {
//       List<Map> readData = await data_metter.readData("""
//           SELECT * FROM 'RealTimeReads_Table'
//       """);
//       if (readData.isEmpty) {
//         int insertD = await data_metter.insertData("""
//       INSERT INTO 'RealTimeReads_Table' ('Real_Time_Read','Added_To_Real_Time')
//       VALUES ('${All_Consumption.toDouble()}','${Added_Read.toDouble()}')
//       """);
//         print(
//             "insert_d OfLine ===========  RealTimeReads_Table In Catch  =========== $insertD");
//         print(
//             "Read_Data OfLine ===========  RealTimeReads_Table  =========== $readData");
//       }
//     } else if (task == 'get') {
//       Check_Response_On_Server_Or_Sql = true;
//       List<Map> readData = await data_metter.readData("""
//           SELECT * FROM 'RealTimeReads_Table'
//       """);
//       if (readData.isNotEmpty) {
//         for (var element in readData) {
//           element.forEach((key, value) {
//             if (key == 'Real_Time_Read') {
//               All_Consumption = value;
//             } else if (key == 'Added_To_Real_Time') Added_Read = value;
//           });
//         }
//         All_Consumption += Added_Read;
//         print(
//             'SELECT ===========  RealTimeReads_Table  =========== $readData ==== ${Added_Read.toDouble()}');
//       }
//     }
//   }
// }
//
// class Daily_Consumption_Class {
//   Map<String, dynamic>? Response_Statistics;
//
//   Future<dynamic> GetAllResponse_Statistics_OnLine() async {
//     try{
//
//
//       var url = "http://$DeviceIpAddress:$Port/${API}/GetConsumption";
//       final response = await http
//           .get(
//         Uri.parse(url),
//       )
//           .timeout(const Duration(seconds: 5), onTimeout: () {
//         // CheckServerOnOrOff = true;
//         return http.Response('Error', 500);
//       });
//       if (response.statusCode == 200) {
//         Response_Statistics = json.decode(response.body);
//         print("$Now_Houres  Test");
//         Get_All_Consumption_Day_OnLine();
//         Daily_Consumption_Data_OnLine();
//       }
//     }
//     catch(Erorr)
//     {
//       print('    -----  Error ----- ${Erorr}');
//     }
//     return Response_Statistics;
//   }
//
//   int Devise_number = 0;
//
//   int Get_Number_devise(int indexUp) {
//     Response_Statistics!.forEach((Hour, deviseMap) {
//       // print('Hour :  ${Hour}');
//       if (Hour == indexUp.toString()) {
//         Devise_number = deviseMap.length;
//       } else {
//         return;
//       }
//     });
//     return Devise_number;
//   }
//
//   String Devise_Name_Return_Faunction = '';
//   List<String> Devise_Name_Return_List = [];
//
//   String Get_Name_Devise_OnLine(int indexUp) {
//     Devise_Name_Return_List.clear();
//     Response_Statistics!.forEach((Hour, deviseMap) {
//       if (Hour == indexUp.toString()) {
//         deviseMap.forEach((deviseName, deviseObjects) {
//           // print('Devise_number :  ${Devise_number} ');
//           // print('Devise_Name :  ${Devise_Name}');
//           Devise_Name_Return_Faunction = deviseName;
//           Devise_Name_Return_List.add(deviseName);
//         });
//       } else {
//         return;
//       }
//     });
//     return Devise_Name_Return_Faunction != ''
//         ? Devise_Name_Return_Faunction
//         : 'null';
//   }
//
//   int Get_All_Consumption_Devise_OnLine(int indexHour) {
//     int returnConsumption = 0;
//     List<int> deviseValueReturnList = [];
//     deviseValueReturnList.clear();
//     Response_Statistics!.forEach((Hour, deviseMap) {
//       if (Hour == indexHour.toString()) {
//         deviseMap.forEach((deviseName, deviseObjects) {
//           deviseObjects.forEach((deviseKeyValue, deviseObjectsValue) {
//             if (deviseKeyValue == 'WattInHour') {
//               deviseValueReturnList.add(deviseObjectsValue);
//             }
//           });
//         });
//       } else {
//         return;
//       }
//       for (var Value in deviseValueReturnList) {
//         returnConsumption += Value;
//       }
//     });
//
//     // print('==========================  66666666666666 ================================= ${a}');
//     return returnConsumption;
//   }
//
//   int Get_All_Consumption_Day_OnLine() {
//     int returnConsumptionTemp = 0;
//     List<int> allConsumptionValueListTemp = [];
//     returnConsumptionTemp = 0;
//     allConsumptionValueListTemp.clear();
//     Response_Statistics!.forEach((Hour, deviseMap) {
//       int tempHour = int.parse(Hour);
//       // print('=====================  FFFFFFFFFFFFFFFFFFFFFF =============== ${Hour}');
//       if (tempHour < Now_Houres) {
//         deviseMap.forEach((deviseName, deviseObjects) {
//           deviseObjects.forEach((deviseKeyValue, deviseObjectsValue) {
//             if (deviseKeyValue == 'WattInHour') {
//               allConsumptionValueListTemp.add(deviseObjectsValue);
//             }
//           });
//         });
//       }
//     });
//     for (var Value in allConsumptionValueListTemp) {
//       returnConsumptionTemp += Value;
//     }
//     // print('=====================  FFFFFFFFFFFFFFFFFFFFFF =============== ${Return_Consumption_Temp}');
//     return returnConsumptionTemp;
//   }
//
//   Future<dynamic> Daily_Consumption_Data_OnLine() async {
//     int returnConsumption = 0;
//     List<int> deviseValueReturnList = [];
//     List<int> storedInDatabase = [];
//     deviseValueReturnList.clear();
//     storedInDatabase.add(0);
//     Response_Statistics!.forEach((Hour, deviseMap) {
//       deviseValueReturnList.clear();
//       returnConsumption = 0;
//       deviseMap.forEach((deviseName, deviseObjects) {
//         deviseObjects.forEach((deviseKeyValue, deviseObjectsValue) {
//           if (deviseKeyValue == 'WattInHour') {
//             deviseValueReturnList.add(deviseObjectsValue);
//           }
//         });
//       });
//       for (var Value in deviseValueReturnList) {
//         returnConsumption += Value;
//       }
//       storedInDatabase.add(returnConsumption);
//       // a++;
//     });
//     // print(
//     //     '==========================  66666666666666 =================================  ${Stored_in_DataBase}');
//
//     List<Map> readData = await data_metter.readData("""
//           SELECT * FROM 'Daily_Consumption_Table'
//       """);
//     // print("Read_Data Onn =================================== ${Read_Data}");
//     if (readData.isEmpty) {
//       // var maxa = Stored_in_DataBase;
//       // int insert_d = 0;
//       for (int i = 0; i <= 24; i++) {
//         await data_metter.insertData("""
//       INSERT INTO Daily_Consumption_Table ('Houres','Kilowatt')
//       VALUES ('$i','${storedInDatabase[i]}')
//       """);
//       }
//       // print("insert_d Onn =================================== ${insert_d}");
//     } else if (readData.isNotEmpty) {
//       // int update_d = 0;
//       for (int i = 0; i <= 24; i++) {
//         await data_metter.updateData("""
//         UPDATE  'Daily_Consumption_Table' SET
//        'Houres' = $i,
//        'Kilowatt' = ${storedInDatabase[i]}
//         WHERE Daily_Consumption_id = $i
//       """);
//       }
//       print("$readData");
//       // print("update_d Onn =================================== ${update_d}");
//     }
//
//     List allConsumptionsDays = [];
//     for (var element in readData) {
//       element.forEach((key, value) {
//         if (key == 'Kilowatt') {
//           allConsumptionsDays.add(value);
//         }
//       });
//     }
//     // print('------------------------------------------------------------------- ${All_Consumptions_Days}');
//     return returnConsumption;
//   }
//
//   int? All_Day_Consumptions;
//   List<int> Devise_Houres_Return_List = [];
//   List<int> Devise_Kilowatt_Return_List = [];
//
//   Future<dynamic> Daily_Consumption_Data_OffLine(int indexHoure) async {
//     // print('====================ddddddddddddddddddddddddddddddddddddddddddddd================= ${Index_Houre}');
//     int returnConsumption = 0;
//     Devise_Houres_Return_List.clear();
//     Devise_Kilowatt_Return_List.clear();
//     List<Map> readData = await data_metter.readData("""
//           SELECT * FROM 'Daily_Consumption_Table'
//       """);
//     if(readData.isNotEmpty)
//       {
//
//         int i = 0;
//         // print('====================ddddddddddddddddddddddddddddddddddddddddddddd================= ${Read_Data}');
//         for (var elements in readData) {
//           elements.forEach((key, value) {
//             // int index = int.parse(key.toString());
//             if (key == 'Houres') {
//               if (value <= indexHoure) {
//                 Devise_Houres_Return_List.add(value);
//               }
//             }
//
//             if (key == 'Kilowatt') {
//               i++;
//               // print('====================ddddddddddddddddddddddddddddddddddddddddddddd================= ${i}');
//               if (i <= indexHoure) {
//                 Devise_Kilowatt_Return_List.add(value);
//               }
//             }
//           });
//         }
//         for (var Value in Devise_Kilowatt_Return_List) {
//           returnConsumption += Value;
//         }
//
//         All_Day_Consumptions = returnConsumption;
//         // print(
//         //     '==========================  66666666666666 ================================= ${Devise_Houres_Return_List}');
//         // print(
//         //     '==========================  66666666666666 ================================= ${Devise_Kilowatt_Return_List}');
//
//       }
//     return All_Day_Consumptions;
//   }
// }
//
// class ListItem {
//   String Nmuber_Month;
//   String Month_Name;
//
//   ListItem(this.Nmuber_Month, this.Month_Name);
// }
//
// List<ListItem> DropdownItems_Months = [
//   ListItem('1', "يناير"),
//   ListItem('2', "فبراير"),
//   ListItem('3', "مارس"),
//   ListItem('4', "أبريل"),
//   ListItem('5', "مايو"),
//   ListItem('6', "يونيو"),
//   ListItem('7', "يوليو"),
//   ListItem('8', "أغسطس"),
//   ListItem('9', "سبتمبر"),
//   ListItem('10', "أكتوبر"),
//   ListItem('11', "نوفمبر"),
//   ListItem('12', "ديسمبر")
// ];
//
// class Statistics_Functions {
//   int Countter_Statistics_Length = 0;
//   Map<String, dynamic> Response_Statistics = {};
//   List<double> Add_value = [];
//   double Sim_Max_Value = 0.0;
//   double sim_max = 0.0;
//   var Max_Value;
//
//
//   GetAllResponse_Statistics() async {
//     try{
//
//
//       var url = "http://$DeviceIpAddress:$Port/${API}/GetStatisticsConsumption";
//       var data = {
//         "Choice": Type_Statistics.toInt(),
//         "Day": Day_now.toInt(),
//         "Month": Month_now.toInt(),
//         "Year": Year_now.toInt(),
//       };
//
//       var response = await http
//           .post(Uri.parse(url), body: json.encode(data))
//           .timeout(const Duration(seconds: 5), onTimeout: () {
//         // CheckServerOnOrOff = true;
//         return http.Response('Error', 500);
//       });
//       if (response.statusCode == 200) {
//         Response_Statistics = json.decode(response.body);
//         // data_consump.clear();
//         data_consump.clear();
//         Max_Value = Response_Statistics.values.first;
//         for (var value in Response_Statistics.values) {
//           double a=double.parse(value.toString());
//           data_consump.add(a);
//           // data_consump.add(value);
//           if (value > Max_Value) {
//             Max_Value = value;
//           }
//         }
//
//         Sim_Max_Value = Max_Value / 20;
//         Add_value.clear();
//         sim_max = Sim_Max_Value;
//         Add_value.add(Sim_Max_Value);
//         for (int i = 1; i < 20; i++) {
//           sim_max += Sim_Max_Value;
//           Add_value.add(sim_max);
//         }
//
//         // Response_Statistics.forEach((key, value) {
//         //   Response_Statistics_List.add(value);
//         // });
//         // int Max_Value = 0;
//         Countter_Statistics_Length = Response_Statistics!.length;
//
//         Change_Index_Consumption();
//
//         print("Response_Statistics    ::-----::    $Response_Statistics");
//         print(
//             "Countter_Statistics_Length    ::::  $Countter_Statistics_Length\n --------- Type_Statistics:   $Type_Statistics\n"
//                 "  Day_now: $Day_now\n  Month_now: $Month_now \n Year_now:  $Year_now\n  ");
//         //alldata=[response.body];
//         return json.decode(response.body);
//       }
//     }
//     catch(Erorr)
//     {
//       print('    -----  Error ----- ${Erorr}');
//     }
//     return Response_Statistics;
//   }
//
//   int generateRandomNumber(int min, int max) {
//     final random = Random();
//     int w = max - min + 1;
//     int S = min + random.nextInt(w);
//     return S;
//   }
//
//   int main() {
//     // Example usage:
//     int randomNumber = generateRandomNumber(100, 5000);
//     return randomNumber;
//   }
//
//   Change_Index_Consumption() async {
//     Day_Index_Popup.clear();
//     if (Year_now.toInt() == selectedDate.year.toInt() &&
//         Month_now.toInt() == selectedDate.month.toInt()) {
//       Day_Index_Popup =
//           List.generate(selectedDate.day.toInt(), (index) => index + 1);
//     } else {
//       /*var url = "http://${DeviceIpAddress}:${Port}/${API}/GetStatisticsConsumption";
//       var data = {
//         "Choice": 2.toInt(),
//         "Day": Day_now.toInt(),
//         "Month": Month_now.toInt(),
//         "Year": Year_now.toInt(),
//       };
//       var response = await http.post(Uri.parse(url), body: json.encode(data));
//       if (response.statusCode == 200) {
//         Response_Statistics = json.decode(response.body);*/
//
//       Day_Index_Popup = List.generate(30, (index) => index + 1);
//     }
//
//     if (Type_Statistics == 3) {
//       Temp_Data.clear();
//       Temp_Data.add(0);
//       Response_Statistics!.forEach((key, value) {
//         Temp_Data.add(value);
//       });
//
//       Temp_Index.clear();
//       if (selectedDate.year.toInt() == Year_now.toInt()) {
//         Temp_Index =
//             List.generate(selectedDate.month.toInt(), (index) => index + 1);
//       } else {
//         Temp_Index =
//             List.generate(Countter_Statistics_Length, (index) => index + 1);
//       }
//     }
//     ////  Years
//
//     ////  Months
//     else if (Type_Statistics == 2) {
//       Temp_Data.clear();
//       Temp_Data.add(0);
//       Response_Statistics!.forEach((key, value) {
//         Temp_Data.add(value);
//       });
//
//       Temp_Index.clear();
//       if (selectedDate.year.toInt() == Year_now.toInt()) {
//         if (selectedDate.month.toInt() < Month_now.toInt()) {
//           Temp_Index = List.generate(0, (index) => index + 1);
//         } else if (selectedDate.month.toInt() == Month_now.toInt()) {
//           Temp_Index =
//               List.generate(selectedDate.day.toInt(), (index) => index + 1);
//         } else {
//           Temp_Index =
//               List.generate(Countter_Statistics_Length, (index) => index + 1);
//         }
//       } else {
//         Temp_Index =
//             List.generate(Countter_Statistics_Length, (index) => index + 1);
//       }
//     }
//     ////  Months
//
//     ////  Days
//     else if (Type_Statistics == 1) {
//       Temp_Data.clear();
//       Temp_Data.add(0);
//       Response_Statistics!.forEach((key, value) {
//         Temp_Data.add(value);
//       });
//       Temp_Index.clear();
//       if (selectedDate.year.toInt() == Year_now.toInt()) {
//         if (selectedDate.month.toInt() == Month_now.toInt()) {
//           if (selectedDate.day.toInt() < Day_now.toInt()) {
//             Temp_Index = List.generate(0, (index) => index + 1);
//           } else {
//             if (Day_now.toInt() != selectedDate.day.toInt()) {
//               Temp_Index = List.generate(
//                   Countter_Statistics_Length, (index) => index + 1);
//             } else {
//               Temp_Index = List.generate(
//                   selectedDate.hour.toInt(), (index) => index + 1);
//             }
//           }
//         } else {
//           Temp_Index =
//               List.generate(Countter_Statistics_Length, (index) => index + 1);
//         }
//       } else {
//         Temp_Index =
//             List.generate(Countter_Statistics_Length, (index) => index + 1);
//       }
//     }
//
//     ////  Days
//
//     // Change_Index_Day_Popup_Bottom_Check = false;
//   }
// }
//
// class Consumption_details_Functions {
//   // var List_Response;
//   int Countter_Statistics_Length = 0;
//   int Index_Day = 0;
//   Map<String, dynamic> Response_Statistics = {};
//
//   Get_All_Response_Bill_Day_Month_Year() async {
//     try{
//
//
//       var url = "http://$DeviceIpAddress:$Port/${API}/GetStatisticsConsumption";
//       var data = {
//         "Choice": Type_Statistics.toInt(),
//         "Day": Day_now.toInt(),
//         "Month": Month_now.toInt(),
//         "Year": Year_now.toInt(),
//       };
//
//       var response = await http
//           .post(Uri.parse(url), body: json.encode(data))
//           .timeout(const Duration(seconds: 5), onTimeout: () {
//         // CheckServerOnOrOff = true;
//         return http.Response('Error', 500);
//       });
//       if (response.statusCode == 200) {
//         Response_Statistics = json.decode(response.body);
//         // List_Response = json.decode(response.body);
//
//         Countter_Statistics_Length = Response_Statistics.length;
//         Temp_Data.clear();
//         Temp_Data.add(0);
//         Response_Statistics.forEach((key, value) {
//           Temp_Data.add(value);
//         });
//         // print(
//         //     '=================================================== YYYYYYYYYYYYYYYYYYYYY ============ ${Temp_Data}');
//         Change_Index_Consumption();
//
//         print("Response_Statistics    ::::    $Response_Statistics");
//         print(
//             "Countter_Statistics_Length    ::::  $Countter_Statistics_Length\n Type_Statistics:   $Type_Statistics\n  Day_now: $Day_now\n  "
//                 "Month_now: $Month_now \n Year_now:  $Year_now\n  ");
//         //alldata=[response.body];
//         return json.decode(response.body);
//       }
//     }
//     catch(Erorr)
//     {
//       print('    -----  Error ----- ${Erorr}');
//     }
//     return Response_Statistics;
//   }
//
//   int generateRandomNumber(int min, int max) {
//     final random = Random();
//     int w = max - min + 1;
//     int S = min + random.nextInt(w);
//     return S;
//   }
//
//   int main() {
//     // Example usage:
//     int randomNumber = generateRandomNumber(100, 5000);
//     return randomNumber;
//   }
//
//   Change_Index_Consumption() async {
//     Day_Index_Popup.clear();
//     if (Year_now.toInt() == selectedDate.year.toInt() &&
//         Month_now.toInt() == selectedDate.month.toInt()) {
//       Day_Index_Popup =
//           List.generate(selectedDate.day.toInt(), (index) => index + 1);
//     } else {
//       /*var url = "http://${DeviceIpAddress}:${Port}/${API}/GetStatisticsConsumption";
//       var data = {
//         "Choice": 2.toInt(),
//         "Day": Day_now.toInt(),
//         "Month": Month_now.toInt(),
//         "Year": Year_now.toInt(),
//       };
//       var response = await http.post(Uri.parse(url), body: json.encode(data));
//       if (response.statusCode == 200) {
//         Response_Statistics = json.decode(response.body);*/
//
//       Day_Index_Popup = List.generate(30, (index) => index + 1);
//     }
//
//     if (Type_Statistics == 3) {
//       Temp_Index.clear();
//       if (selectedDate.year.toInt() == Year_now.toInt()) {
//         Temp_Index =
//             List.generate(selectedDate.month.toInt(), (index) => index + 1);
//       } else {
//         Temp_Index =
//             List.generate(Countter_Statistics_Length, (index) => index + 1);
//       }
//     }
//     ////  Years
//
//     ////  Months
//     else if (Type_Statistics == 2) {
//       Temp_Index.clear();
//       if (selectedDate.year.toInt() == Year_now.toInt()) {
//         if (selectedDate.month.toInt() < Month_now.toInt()) {
//           Temp_Index = List.generate(0, (index) => index + 1);
//         } else if (selectedDate.month.toInt() == Month_now.toInt()) {
//           Temp_Index =
//               List.generate(selectedDate.day.toInt(), (index) => index + 1);
//         } else {
//           Temp_Index =
//               List.generate(Countter_Statistics_Length, (index) => index + 1);
//         }
//       } else {
//         Temp_Index =
//             List.generate(Countter_Statistics_Length, (index) => index + 1);
//       }
//     }
//     ////  Months
//
//     ////  Days
//     else if (Type_Statistics == 1) {
//       Temp_Index.clear();
//       if (selectedDate.year.toInt() == Year_now.toInt()) {
//         if (selectedDate.month.toInt() == Month_now.toInt()) {
//           if (selectedDate.day.toInt() < Day_now.toInt()) {
//             Temp_Index = List.generate(0, (index) => index + 1);
//           } else {
//             if (Day_now.toInt() != selectedDate.day.toInt()) {
//               Temp_Index = List.generate(
//                   Countter_Statistics_Length, (index) => index + 1);
//             } else {
//               Temp_Index = List.generate(
//                   selectedDate.hour.toInt(), (index) => index + 1);
//             }
//           }
//         } else {
//           Temp_Index =
//               List.generate(Countter_Statistics_Length, (index) => index + 1);
//         }
//       } else {
//         Temp_Index =
//             List.generate(Countter_Statistics_Length, (index) => index + 1);
//       }
//     }
//
//     ////  Days
//
//     // Change_Index_Day_Popup_Bottom_Check = false;
//   }
// }
//
// class Bills_Function {
//   Return_Data_Bills() async {
//     return 'qq';
//   }
// }
//
// class Check_Server {
//   Future<bool> Check_Response() async {
//     Get_Response_Server functionsCall = Get_Response_Server();
//
//     try {
//       var responseOnOffServer = await http
//           .get(
//               Uri.parse('http://$DeviceIpAddress:$Port/${API}/CheckServerOnOrOff'))
//           .timeout(const Duration(seconds: 5), onTimeout: () {
//         // CheckServerOnOrOff = true;
//         return http.Response('Error', 500);
//       });
//       var dataResponseOnOffServer = json.decode(responseOnOffServer.body);
//       if (responseOnOffServer.statusCode == 200) {
//
//
//         if(Check_Response_On_Server == true)
//           functionsCall.Get_All_Response_Real_Time();
//
//
//         Check_Response_On_Server = true;
//         if (dataResponseOnOffServer['message'] == "The Server Is Turned Off") {
//           CheckServerOnOrOff = false;
//         } else {
//           // Cgack_Server_In_App = true;
//           CheckServerOnOrOff = true;
//           // Function_SqFlite.OnLine_Set_Configration();
//         }
//         if (All_Consumption <= 0 || Check_Response_On_Server_Or_Sql == true) {
//
//         }
//         print('============================  The Server Is Turned On');
//       }
//     } catch (error) {
//       // this code Fallow Get_All_Response_Real_Time Function
//       // CheckServerOnOrOff = false;
//       Check_Response_On_Server = false;
//       if (All_Consumption <= 0) {
//         SqFlite_Functions functionsCall = SqFlite_Functions();
//         functionsCall.Chack_Data_For_Real_Time('get');
//       }
//       print('============================  The Server Is Turned Off');
//       // CheckServerOnOrOff = true;
//     }
//     return Check_Response_On_Server;
//   }
// }
//
//
// class Statistics_Functions_2 {
//   Map<String, dynamic> Consumption = {};
//   int Countter_Statistics_Length = 0;
//
//   Get() async {
//     try {
//       var url = "http://$DeviceIpAddress:$Port/${API}/GetStatisticsConsumption";
//       var data = {
//         "Choice": Type_Statistics.toInt(),
//         "Day": Day_now.toInt(),
//         "Month": Month_now.toInt(),
//         "Year": Year_now.toInt(),
//       };
//       print('================================================================================================================ ${Type_Statistics}');
//       var response = await http
//           .post(Uri.parse(url), body: json.encode(data))
//           .timeout(const Duration(seconds: 5), onTimeout: () {
//         // CheckServerOnOrOff = true;
//         return http.Response('Error', 500);
//       });
//       if (response.statusCode == 200) {
//         Consumption = json.decode(response.body);
//         Countter_Statistics_Length = Consumption.length;
//         Temp_Data.clear();
//         Temp_Index.clear();
//         Max_Value = 0;
//         for (var value in Consumption.values) {
//           Temp_Data.add(value);
//         }
//         print('================ Consumption ================= ${Temp_Data}');
//
//         for (var value in Consumption.keys) {
//           int temp_key = int.parse(value.toString());
//           Temp_Index.add(temp_key);
//         }
//         print(
//             '================ Index Day or Month or Year ================= ${Temp_Index}');
//
//         Max_Value = Temp_Data[0].toDouble();
//         for (int value in Temp_Data) {
//           if (value > Max_Value) {
//             Max_Value = value.toDouble();
//           }
//         }
//
//         print('================ Max Value ================= ${Max_Value}');
//         Min_Value = Temp_Data[0].toDouble();
//         for (int value in Temp_Data) {
//           if (value < Min_Value) {
//             Min_Value = value.toDouble();
//           }
//         }
//
//         print('================ Min Value ================= ${Min_Value}');
//
//         double Sim_Max_Value = Max_Value / 20;
//         Add_value.clear();
//         double sim_max = Sim_Max_Value;
//         Add_value.add(Sim_Max_Value / 1000);
//         for (int i = 1; i < 20; i++) {
//           sim_max += Sim_Max_Value;
//           Add_value.add(sim_max / 1000);
//         }
//         print(
//             '================ Bar Graph Data in Right ================= ${Add_value}');
//         Change_Index_Consumption();
//       }
//     } catch (Error) {
//       print('    -----  Error ----- ${Error}');
//     }
//
//
//     return Consumption;
//   }
//
//
//   Change_Index_Consumption() async {
//     Day_Index_Popup.clear();
//     if (Year_now.toInt() == selectedDate.year.toInt() &&
//         Month_now.toInt() == selectedDate.month.toInt()) {
//       Day_Index_Popup =
//           List.generate(selectedDate.day.toInt(), (index) => index + 1);
//     } else {
//       /*var url = "http://${DeviceIpAddress}:${Port}/api/GetStatisticsConsumption";
//       var data = {
//         "Choice": 2.toInt(),
//         "Day": Day_now.toInt(),
//         "Month": Month_now.toInt(),
//         "Year": Year_now.toInt(),
//       };
//       var response = await http.post(Uri.parse(url), body: json.encode(data));
//       if (response.statusCode == 200) {
//         Response_Statistics = json.decode(response.body);*/
//
//       Day_Index_Popup = List.generate(30, (index) => index + 1);
//     }
//
//     if (Type_Statistics == 3) {
//       Temp_Data.clear();
//       Temp_Data.add(0);
//       Consumption!.forEach((key, value) {
//         Temp_Data.add(value);
//       });
//
//       Temp_Index.clear();
//       if (selectedDate.year.toInt() == Year_now.toInt()) {
//         Temp_Index =
//             List.generate(selectedDate.month.toInt(), (index) => index + 1);
//       } else {
//         Temp_Index =
//             List.generate(Countter_Statistics_Length, (index) => index + 1);
//       }
//     }
//     ////  Years
//
//     ////  Months
//     else if (Type_Statistics == 2) {
//       Temp_Data.clear();
//       Temp_Data.add(0);
//       Consumption!.forEach((key, value) {
//         Temp_Data.add(value);
//       });
//
//       Temp_Index.clear();
//       if (selectedDate.year.toInt() == Year_now.toInt()) {
//         if (selectedDate.month.toInt() < Month_now.toInt()) {
//           Temp_Index = List.generate(0, (index) => index + 1);
//         } else if (selectedDate.month.toInt() == Month_now.toInt()) {
//           Temp_Index =
//               List.generate(selectedDate.day.toInt(), (index) => index + 1);
//         } else {
//           Temp_Index =
//               List.generate(Countter_Statistics_Length, (index) => index + 1);
//         }
//       } else {
//         Temp_Index =
//             List.generate(Countter_Statistics_Length, (index) => index + 1);
//       }
//     }
//     ////  Months
//
//     ////  Days
//     else if (Type_Statistics == 1) {
//       Temp_Data.clear();
//       Temp_Data.add(0);
//       Consumption!.forEach((key, value) {
//         Temp_Data.add(value);
//       });
//       Temp_Index.clear();
//       if (selectedDate.year.toInt() == Year_now.toInt()) {
//         if (selectedDate.month.toInt() == Month_now.toInt()) {
//           if (selectedDate.day.toInt() < Day_now.toInt()) {
//             Temp_Index = List.generate(0, (index) => index + 1);
//           } else {
//             if (Day_now.toInt() != selectedDate.day.toInt()) {
//               Temp_Index = List.generate(
//                   Countter_Statistics_Length, (index) => index + 1);
//             } else {
//               Temp_Index = List.generate(
//                   selectedDate.hour.toInt(), (index) => index + 1);
//             }
//           }
//         } else {
//           Temp_Index =
//               List.generate(Countter_Statistics_Length, (index) => index + 1);
//         }
//       } else {
//         Temp_Index =
//             List.generate(Countter_Statistics_Length, (index) => index + 1);
//       }
//     }
//
//     ////  Days
//     for (int i = 1; i <= Temp_Index.length; i++) {
//       Avarege += (Temp_Data[i] / 1000);
//     }
//     Avareges = Avarege / Temp_Index.length;
//     // Avarege = Avarege / Temp_Index.length;
//     // Change_Index_Day_Popup_Bottom_Check = false;
//   }
//
//
//   double Avarege = 0;
//   double Avareges = 0;
//
//   // Future<double> Get_Avarege() async
//   // {
//   //   for (var Value in Temp_Data) {
//   //     Avarege += Value;
//   //   }
//   //   print(
//   //       '---------------------------------------------------------------- ${Avarege}');
//   //   Avarege = Avarege / Temp_Data.length / 1000;
//   //   print(
//   //       '---------------------------------------------------------------- ${Avarege}');
//   //
//   //   return Avarege;
//   // }
// }