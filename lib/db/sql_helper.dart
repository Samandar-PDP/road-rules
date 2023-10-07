import 'package:flutter/widgets.dart';
import 'package:road_rules/rule.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sql.dart';

class SqlHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""
        CREATE TABLE rules(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          path TEXT NOT NULL,
          title TEXT NOT NULL,
          desc TEXT NOT NULL,
          type TEXT NOT NULL
        )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('ketmon.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<void> saveRule(Rule rule) async {
    final db = await SqlHelper.db();
    await db.insert('rules', rule.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  static Future<List<Map<String, dynamic>>> getRules() async {
    final db = await SqlHelper.db();
    return db.query('rules', orderBy: 'id');
  }

  static Future<void> updateRule(Rule rule) async {
    final db = await SqlHelper.db();
    await db
        .update('rules', rule.toJson(), where: 'id = ?', whereArgs: [rule.id]);
  }

  static Future<void> delete(int id) async {
    try {
      final db = await SqlHelper.db();
      await db.delete('rules', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
