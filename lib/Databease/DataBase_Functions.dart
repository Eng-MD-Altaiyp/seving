import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase_Metter {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'SAVING_DB.db');
    Database mydb = await openDatabase(path,
        version: 1, onUpgrade: _onUpgrade, onCreate: _onCreate);
    return mydb;
  }

//_onUpgrade: version يتم استدعئها مره واحده عند تغير ال
  _onUpgrade(Database db, int oldversion, int newversion) async{

    print("onUpgrade ====================================");
  }

//_onCreate : هي داله بيتم استدعائها لمرة واحده فقط عند انشاء قاعده البيانات
  _onCreate(Database db, int version) async {
    try {

      await db.execute('''
   CREATE TABLE "goals"( 
  "goals_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   "goal_name" TEXT NOT NULL,
   "goal_type" TEXT NOT NULL,
   "goal_Favorite" INTEGER NOT NULL,
   "goal_price" DOUBLE NOT NULL,
   "amount_paid" DOUBLE NOT NULL,
   "date_start" TEXT NOT NULL,
   "monthly_payment" DOUBLE NOT NULL
         )
    ''');
      await db.execute('''
   CREATE TABLE "Users"( 
  "user_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   "user_name" TEXT NOT NULL,
   "user_email" TEXT NOT NULL,
   "user_password" TEXT NOT NULL
         )
    ''');

      print("Created Database ========================= TTTTTTTTT ==================================  \n");
    } catch (Rerror) {
      print("No Created Database ============================= FFFFFFFFFF ============================== $Rerror  \n");
    }

  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(
        sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
