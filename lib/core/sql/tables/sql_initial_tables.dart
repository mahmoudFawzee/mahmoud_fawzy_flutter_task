import '/core/sql/constants/keys.dart';

import '../constants/tables_names.dart';
import '../local_storage.dart';

const List<DataBaseTable> sqfliteInitialTables = [
  _productsTable,
  _categoriesTable,
  _subCategoriesTable,
  _packagesTable,
];

const _productsTable = DataBaseTable(
  tableName: TablesNames.productsTable,
  columns: [
    TableColumn(
      name: SqlKeys.id,
      columnType: ColumnType.int,
      props: [ColumnProps.primaryKey, ColumnProps.autoIncrement],
    ),
    TableColumn(name: SqlKeys.categoryId, columnType: ColumnType.int),
    TableColumn(name: SqlKeys.subCategoryId, columnType: ColumnType.int),

    TableColumn(name: SqlKeys.name, columnType: ColumnType.string),
    TableColumn(name: SqlKeys.imageUrl, columnType: ColumnType.string),

    TableColumn(name: SqlKeys.price, columnType: ColumnType.double),
    TableColumn(name: SqlKeys.discountedPrice, columnType: ColumnType.double),

    TableColumn(name: SqlKeys.inCart, columnType: ColumnType.int),
    TableColumn(name: SqlKeys.hasOffer, columnType: ColumnType.int),
  ],
);
const _categoriesTable = DataBaseTable(
  tableName: TablesNames.categoriesTable,
  columns: [
    TableColumn(
      name: SqlKeys.id,
      columnType: ColumnType.int,
      props: [ColumnProps.primaryKey, ColumnProps.autoIncrement],
    ),
    TableColumn(name: SqlKeys.name, columnType: ColumnType.string),
    TableColumn(name: SqlKeys.imageUrl, columnType: ColumnType.string),
  ],
);
const _subCategoriesTable = DataBaseTable(
  tableName: TablesNames.subCategoriesTable,
  columns: [
    TableColumn(
      name: SqlKeys.id,
      columnType: ColumnType.int,
      props: [ColumnProps.primaryKey, ColumnProps.autoIncrement],
    ),
    TableColumn(name: SqlKeys.categoryId, columnType: ColumnType.int),

    TableColumn(name: SqlKeys.name, columnType: ColumnType.string),
    TableColumn(name: SqlKeys.imageUrl, columnType: ColumnType.string),
  ],
);
const _packagesTable = DataBaseTable(
  tableName: TablesNames.packagesTable,
  columns: [
    TableColumn(
      name: SqlKeys.id,
      columnType: ColumnType.int,
      props: [ColumnProps.primaryKey, ColumnProps.autoIncrement],
    ),
    TableColumn(name: SqlKeys.bannerString, columnType: ColumnType.string),
    TableColumn(name: SqlKeys.name, columnType: ColumnType.string),
    TableColumn(name: SqlKeys.price, columnType: ColumnType.double),
    TableColumn(name: SqlKeys.availableForDays, columnType: ColumnType.int),
    TableColumn(name: SqlKeys.repeatingRatio, columnType: ColumnType.double),
    TableColumn(name: SqlKeys.features, columnType: ColumnType.string),
  ],
);
