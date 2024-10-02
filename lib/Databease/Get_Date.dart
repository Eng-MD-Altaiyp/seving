import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// نموذج Goal (موجود مسبقاً في كودك)
class Goal {
  final int goalsId;
  final String goalName;
  final String goalType;
  final int? goalFavorite;
  final double goalPrice;
  final double? amountPaid;
  final String dateStart;
  final double monthlyPayment;

  Goal({
    required this.goalsId,
    required this.goalName,
    required this.goalType,
    this.goalFavorite,
    required this.goalPrice,
    this.amountPaid,
    required this.dateStart,
    required this.monthlyPayment,
  });

  // تحويل البيانات من Map إلى كائن Goal
  factory Goal.fromMap(Map<String, dynamic> json) {
    return Goal(
      goalsId: json['goals_id'],
      goalName: json['goal_name'],
      goalType: json['goal_type'],
      goalFavorite: json['goal_Favorite'],
      goalPrice: json['goal_price'],
      amountPaid: json['amount_paid'],
      dateStart: json['date_start'],
      monthlyPayment: json['monthly_payment'],
    );
  }
}

// الدالة لجلب البيانات من قاعدة البيانات
Future<List<Goal>> fetchGoals() async {
  // فتح قاعدة البيانات (تأكد من وجود قاعدة البيانات قبل تشغيل التطبيق)
  final database = openDatabase(
    join(await getDatabasesPath(), 'SAVING_DB.db'),
  );

  final Database db = await database;

  // جلب جميع البيانات من جدول goals
  final List<Map<String, dynamic>> maps = await db.query('goals');

  // تحويل كل صف من قاعدة البيانات إلى كائن Goal
  return List.generate(maps.length, (i) {
    return Goal.fromMap(maps[i]);
  });
}

