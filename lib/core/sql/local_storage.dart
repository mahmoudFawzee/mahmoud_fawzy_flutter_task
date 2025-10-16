import 'package:equatable/equatable.dart';

abstract class LocalStorageClient {
  ///start the data base.
  Future init();
  Future<Map<String, dynamic>?> getRecord(
    String tableName, {
    RecordFiltering? recordFilter,
  });

  ///this method for deleting all rows in the data base
  ///
  ///not drop whole table
  Future clearTable(String tableName);

  ///checks if table is empty or not
  Future<bool> isEmptyTable(String tableName);

  ///get table rows based on some condition
  Future<List<Map<String, dynamic>?>> getRecords(
    String tableName, {
    RecordFiltering? recordFilter,
    int? perPage,
    int? offset,
  });

  ///get table rows based on some condition
  Future<List<Map<String, dynamic>?>> getPaginatedRecords(
    String tableName, {
    required RecordFiltering? recordFilter,
    required int perPage,
    required int offset,
  });

  ///get all rows in table
  Future<List<Map<String, dynamic>?>> getFullTable(String tableName);

  ///checks if table exists or not
  Future<bool> isTableExists(String tableName);

  ///this used to create a new table or box
  ///like when i try to store a new records of a new
  ///dart type like [Task] or [User] i use this to create
  ///the place i will store them in like [Table] in sqflite
  ///or [Box] in hive.
  Future createTable({required DataBaseTable table});

  ///insert a single record to database
  Future<bool> insert(String tableName, Map<String, dynamic> record);

  ///insert more than one record to data base
  Future<bool> insertRecords(
    String tableName,
    List<Map<String, dynamic>> records,
  );

  ///delete a single record from database
  Future<bool> deleteRecord(String tableName, {RecordFiltering? filtering});

  ///end database
  Future dispose();
}

///blueprint of the [table] or [box] we add to the data base
///it has [name] and [columns]
class DataBaseTable {
  final String tableName;
  final List<TableColumn> columns;
  const DataBaseTable({required this.tableName, required this.columns});

  ///abstract method to use to execute when we want to store the table.
  String toSqlQuery() {
    return 'CREATE TABLE $tableName ${columnsSqlToQuery()}';
  }

  ///abstract method to use to execute when we want to convert
  ///table columns to query to use them in [toSqlQuery] to store them.
  ///based on the database we use [hive] or [sqflite] or another database.
  String columnsSqlToQuery() {
    String query = '';
    for (var column in columns) {
      final isLast = columns.last == column;
      final trailing = isLast ? '' : ',';
      query += ' ${column.toSqlQuery()}$trailing';
    }
    return '($query)';
  }
}

class TableColumn {
  ///column name like [id] or [date]
  final String name;

  ///column type like [ColumnType.int] which refer to INTEGER in sql
  ///
  ///[ColumnType.double] which refer to REAL in sql
  ///
  ///[ColumnType.string] which refer to TEXT in sql
  final ColumnType columnType;

  ///this is the list of props for the column
  ///[ColumnProps.primaryKey] which refer to PRIMARY KEY in sql
  final List<ColumnProps> props;

  const TableColumn({
    required this.name,
    required this.columnType,
    this.props = const [],
  });

  String _getPropsString(List<ColumnProps> props) {
    String propsStr = '';
    for (var prop in props) {
      propsStr += ' ${prop.toSql()}';
    }
    return propsStr;
  }

  String toSqlQuery() {
    final q = '$name ${columnType.toSql()}${_getPropsString(props)}';
    return q;
  }
}

class RecordFiltering extends Equatable {
  final List<FilteringColumn> filteringColumns;
  const RecordFiltering(this.filteringColumns);

  ///[key=?, key2=? ]
  String? get where {
    String whereValue = '';
    for (var column in filteringColumns) {
      final isLast = column == filteringColumns.last;
      final trailing = isLast ? '' : ',';
      final val = '${column.key}=?$trailing';
      whereValue += val;
    }
    if (whereValue.isEmpty) return null;
    return whereValue;
  }

  List<Object?>? get whereArgus {
    if (filteringColumns.isEmpty) return null;
    return filteringColumns.map((item) => item.value).toList();
  }

  List<String> get columns => filteringColumns.map((item) => item.key).toList();
  @override
  List<Object?> get props => [filteringColumns];
}

class FilteringColumn extends Equatable {
  final String key;
  final dynamic value;
  const FilteringColumn(this.key, this.value);
  @override
  List<Object?> get props => [key, value];
}

enum ColumnType { string, int, double }

extension ColumnTypesToSql on ColumnType {
  String toSql() {
    if (this == ColumnType.double) return 'REAL';
    if (this == ColumnType.int) return 'INTEGER';
    return 'TEXT';
  }
}

enum ColumnProps { primaryKey, autoIncrement, notNull }

extension ColumnPropsToSql on ColumnProps {
  String toSql() {
    if (this == ColumnProps.primaryKey) return 'PRIMARY KEY';
    if (this == ColumnProps.autoIncrement) {
      return 'autoincrement'.toUpperCase();
    }
    if (this == ColumnProps.notNull) return 'not null'.toUpperCase();
    return '';
  }
}
