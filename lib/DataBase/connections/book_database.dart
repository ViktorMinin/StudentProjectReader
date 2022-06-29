import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:new_project/DataBase/models/book_info.dart';

class BookInfoDatabase {
  static final BookInfoDatabase instance = BookInfoDatabase._init();
  static Database? _database;
  BookInfoDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      print(_database!.path);
      return _database!;
    }
    _database = await _initDB("BookInfoDataBase.db");

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const String textType = "TEXT";
    const String textTypeNotNull = "TEXT NOT NULL";
    const String isLikedType = "INTEGER";
    await db.execute('''
      CREATE TABLE $tableName (
        ${BookFields.id} $idType,
        ${BookFields.bookName} $textTypeNotNull,
        ${BookFields.description.toString()} $textType,
        ${BookFields.author} $textType,
        ${BookFields.bookPath} $textTypeNotNull,
        ${BookFields.isLiked} $isLikedType
      )
''');
  }

  Future updateIsLiked(int? id, int current) async {
    final db = await instance.database;
    if (current == 1) {
      db.update(
        tableName,
        <String, dynamic>{BookFields.isLiked: 0},
        where: "${BookFields.id}=?",
        whereArgs: [id],
      );
    } else {
      db.update(
        tableName,
        <String, dynamic>{BookFields.isLiked: 1},
        where: "${BookFields.id}=?",
        whereArgs: [id],
      );
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<Book> create(Book book) async {
    final db = await instance.database;
    final id = await db.insert(tableName, book.toJson());
    return book.copy(id: id);
  }

  Future<Book> readData(int id) async {
    final db = await instance.database;
    final map = await db.query(
      tableName,
      columns: BookFields.values,
      where: "${BookFields.id} =?",
      whereArgs: [id],
    );
    if (map.isNotEmpty) {
      return Book.fromJson(map.first);
    } else
      throw Exception("Id was not found");
  }

  Future<List<Book>> readDataByDate() async {
    final db = await instance.database;
    final map = await db.query(
      tableName,
      columns: BookFields.values,
      orderBy: "date(description) DESC LIMIT 2",
    );
    if (map.isNotEmpty) {
      return (map.map((json) => Book.fromJson(json)).toList());
    } else
      throw Exception("Id was not found");
  }

  Future<List<Book>> readDataByIsLiked() async {
    final db = await instance.database;
    final map = await db.query(
      tableName,
      columns: BookFields.values,
      where: "isLiked=1",
    );
    return (map.map((json) => Book.fromJson(json)).toList());
  }

/*
  Future addToFavorite(int id) async {
    final db = await instance.database;
    db.query("INSERT TRUE IN ")
  }
*/
  Future<List<Book>> readAllBook() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((json) => Book.fromJson(json)).toList();
  }

  Future<int> delete(int? id) async {
    final db = await instance.database;
    return await db.delete(
      tableName,
      where: '${BookFields.id}=?',
      whereArgs: [id],
    );
  }
}
