import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tadhkir/core/model/event.dart';
import 'package:tadhkir/core/model/card.dart';

class MyDb {
  static Database? _db;
  static const String tableName1 = "events";
  static const String tableName2 = "cards";
  static const String dbName = "event.db";

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    }
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    Database myDb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // await db.execute("ALTER TABLE task ADD COLUMN color TEXT NOT NULL");
    print("onUpgrade Database Success !");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableName1(
            id INTEGER NOT NULL PRIMARY KEY,
            title TEXT NOT NULL,
            details TEXT NOT NULL,
            pickedDate TEXT NOT NULL,
            pickedTime TEXT NOT NULL,
            notification TEXT NOT NULL
          )
    ''');
    await db.execute('''
          CREATE TABLE $tableName2(
            id INTEGER NOT NULL PRIMARY KEY,
            title TEXT NOT NULL,
            idCard TEXT NOT NULL,
            pickedDate TEXT NOT NULL,
            pickedTime TEXT NOT NULL,
            notification TEXT NOT NULL,
            typeCard TEXT NOT NULL
          )
    ''');
    print("Create Database Success !");
  }

  Future<int> insertData(Event event) async {
    Database? database = await db;
    return await database!.insert(tableName1, event.toMap());
  }

  Future<int> insertCard(CardDate card) async {
    Database? database = await db;
    return await database!.insert(tableName2, card.toMap());
  }

  Future<int> updateEvent(Event event) async {
    Database? database = await db;
    return await database!.update(
      tableName1,
      event.toMap(),
      where: "id = ?",
      whereArgs: [event.id],
    );
  }

  Future<int> updateCard(CardDate card) async {
    Database? database = await db;
    return await database!.update(
      tableName2,
      card.toMap(),
      where: "id = ?",
      whereArgs: [card.id],
    );
  }

  Future<List<Event>> readEvent() async {
    Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query(tableName1);
    return List.generate(
      maps.length,
      (index) {
        return Event(
            id: maps[index]["id"],
            title: maps[index]["title"],
            details: maps[index]["details"],
            isNotification: maps[index]["notification"],
            pickedDate: maps[index]["pickedDate"],
            pickedTime: maps[index]["pickedTime"]);
      },
    );
  }

  Future<List<CardDate>> readCard() async {
    Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query(tableName2);
    return List.generate(
      maps.length,
      (index) {
        return CardDate(
            id: maps[index]["id"],
            title: maps[index]["title"],
            idCard: maps[index]["idCard"],
            isNotification: maps[index]["notification"],
            pickedDate: maps[index]["pickedDate"],
            typeCard: maps[index]["typeCard"],
            pickedTime: maps[index]["pickedTime"]);
      },
    );
  }

  Future<int> deleteEvent(Event event) async {
    Database? database = await db;
    return await database!.delete(
      tableName1,
      where: "id = ?",
      whereArgs: [event.id],
    );
  }

  Future<int> deleteCard(CardDate card) async {
    Database? database = await db;
    return await database!.delete(
      tableName2,
      where: "id = ?",
      whereArgs: [card.id],
    );
  }

  Future<int> deleteAllEvents() async {
    Database? database = await db;
    return await database!.delete(tableName1);
  }
}
