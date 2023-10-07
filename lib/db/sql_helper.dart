import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""
        CREATE TABLE rules(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          path TEXT NOT NULL,
        
        )
      """);
  }
}
