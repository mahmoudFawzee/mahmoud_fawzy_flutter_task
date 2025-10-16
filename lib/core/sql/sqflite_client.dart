import 'dart:isolate';
import '/core/sql/tables/sql_initial_tables.dart';
import '/core/sql/local_storage.dart';
import 'package:sqflite/sqflite.dart';

final class SqfliteClient implements LocalStorageClient {
  SqfliteClient._privateConstructor();
  static final SqfliteClient _instance = SqfliteClient._privateConstructor();
  factory SqfliteClient() => _instance;
  Database? _db;

  @override
  Future init() async {
    //?update db version because i will change users scheme
    _db = await openDatabase(
      'task.db',
      version: 1,
      onCreate: (db, version) async {
        await _initTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {},
    );
  }

  Future _initTables(Database db) async {
    for (var table in sqfliteInitialTables) {
      await _tablesOnCreate(db, table: table);
    }
  }

  Future<Database> get _getDB async {
    //if (_db == null) await init();
    return _db!;
  }

  Future _tablesOnCreate(Database db, {required DataBaseTable table}) async {
    final query = await Isolate.run(() => table.toSqlQuery());
    await db.execute(query);
  }

  @override
  Future createTable({required DataBaseTable table}) async {
    final db = await _getDB;
    final query = await Isolate.run(() => table.toSqlQuery());

    await db.execute(query);
  }

  @override
  Future<Map<String, dynamic>?> getRecord(
    String tableName, {
    RecordFiltering? recordFilter,
  }) async {
    final maps = await getRecords(tableName, recordFilter: recordFilter);
    if (maps.isNotEmpty) return maps.first;
    return null;
  }

  @override
  Future<List<Map<String, dynamic>?>> getRecords(
    String tableName, {
    RecordFiltering? recordFilter,
  }) async {
    final db = await _getDB;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      columns: recordFilter?.columns,
      where: recordFilter?.where,
      whereArgs: recordFilter?.whereArgus,
    );
    return maps;
  }

  @override
  Future<bool> insert(String tableName, Map<String, dynamic> record) async {
    final db = await _getDB;
    final id = await db.insert(tableName, record);
    return id != 0;
  }

  @override
  Future<bool> isTableExists(String tableName) async {
    final db = await _getDB;
    final result = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name=?;",
      [tableName],
    );
    return result.isNotEmpty;
  }

  @override
  Future dispose() async {
    await _db?.close();
  }

  @override
  Future<bool> deleteRecord(
    String tableName, {
    RecordFiltering? filtering,
  }) async {
    final db = await _getDB;
    final result = await db.delete(
      tableName,
      where: filtering?.where,
      whereArgs: filtering?.whereArgus,
    );
    return result != 0;
  }

  @override
  Future<List<Map<String, dynamic>?>> getFullTable(String tableName) async {
    final db = await _getDB;
    final tableExists = await isTableExists(tableName);
    if (!tableExists) return [];
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps;
  }

  @override
  Future clearTable(String tableName) async {
    final db = await _getDB;
    await db.delete(tableName);
  }

  @override
  Future<bool> isEmptyTable(String tableName) async {
    final data = await getFullTable(tableName);
    return data.isEmpty;
  }

  @override
  Future<bool> insertRecords(
    String tableName,
    List<Map<String, dynamic>> records,
  ) async {
    final results = await Future.wait(
      records.map((record) => insert(tableName, record)),
    );
    return results.every((result) => result);
  }

  @override
  Future<List<Map<String, dynamic>?>> getPaginatedRecords(
    String tableName, {
    required RecordFiltering? recordFilter,
    required int perPage,
    required int offset,
  }) async {
    final db = await _getDB;
    return await db.query(
      tableName,
      columns: recordFilter?.columns,
      where: recordFilter?.where,
      whereArgs: recordFilter?.whereArgus,
      limit: perPage,
      offset: offset,
    );
  }
}
