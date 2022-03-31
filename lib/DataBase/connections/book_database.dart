import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:new_project/DataBase/models/book_info.dart';

class BookInfoDatabase {
  static final BookInfoDatabase instance = BookInfoDatabase.init();
  static Database? _database;
  BookInfoDatabase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;
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
    await db.execute('''
      CREATE TABLE $tableName (
        ${BookFields.id} $idType,
        ${BookFields.bookName} $textTypeNotNull;
        ${BookFields.description} $textType;
        ${BookFields.author} $textType;
        ${BookFields.bookPath} $textTypeNotNull;
      )
''');
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

  Future<List<Book>> readAllBook() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((json) => Book.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableName,
      where: '${BookFields.id}=?',
      whereArgs: [id],
    );
  }
}
