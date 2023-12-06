// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_book_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAddressBookDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AddressBookDatabaseBuilder databaseBuilder(String name) =>
      _$AddressBookDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AddressBookDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AddressBookDatabaseBuilder(null);
}

class _$AddressBookDatabaseBuilder {
  _$AddressBookDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AddressBookDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AddressBookDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AddressBookDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AddressBookDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AddressBookDatabase extends AddressBookDatabase {
  _$AddressBookDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AddressBookDao? _addressBookDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AddressBook` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `remarks` TEXT, `walletType` TEXT, `walletAddress` TEXT, `isDefault` INTEGER, `createDate` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AddressBookDao get addressBookDao {
    return _addressBookDaoInstance ??=
        _$AddressBookDao(database, changeListener);
  }
}

class _$AddressBookDao extends AddressBookDao {
  _$AddressBookDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _addressBookInsertionAdapter = InsertionAdapter(
            database,
            'AddressBook',
            (AddressBook item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'remarks': item.remarks,
                  'walletType': item.walletType,
                  'walletAddress': item.walletAddress,
                  'isDefault': item.isDefault,
                  'createDate': item.createDate
                },
            changeListener),
        _addressBookUpdateAdapter = UpdateAdapter(
            database,
            'AddressBook',
            ['id'],
            (AddressBook item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'remarks': item.remarks,
                  'walletType': item.walletType,
                  'walletAddress': item.walletAddress,
                  'isDefault': item.isDefault,
                  'createDate': item.createDate
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AddressBook> _addressBookInsertionAdapter;

  final UpdateAdapter<AddressBook> _addressBookUpdateAdapter;

  @override
  Future<List<AddressBook>?> findAddressBookAll() async {
    return _queryAdapter.queryList('SELECT * FROM AddressBook order by id desc',
        mapper: (Map<String, Object?> row) => AddressBook(
            row['id'] as int?,
            row['name'] as String?,
            row['remarks'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['isDefault'] as int?,
            row['createDate'] as int?));
  }

  @override
  Future<List<AddressBook>?> findAddressBookPage(
      int startIndex, int pageSize) async {
    return _queryAdapter.queryList(
        'SELECT * FROM AddressBook order by id desc limit ?1,?2',
        mapper: (Map<String, Object?> row) => AddressBook(
            row['id'] as int?,
            row['name'] as String?,
            row['remarks'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['isDefault'] as int?,
            row['createDate'] as int?),
        arguments: [startIndex, pageSize]);
  }

  @override
  Stream<AddressBook?> findAddressBookById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM AddressBook WHERE id = ?1',
        mapper: (Map<String, Object?> row) => AddressBook(
            row['id'] as int?,
            row['name'] as String?,
            row['remarks'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['isDefault'] as int?,
            row['createDate'] as int?),
        arguments: [id],
        queryableName: 'AddressBook',
        isView: false);
  }

  @override
  Future<void> deleteAddressBookById(int id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM AddressBook  WHERE  id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> deleteAddressBook() async {
    await _queryAdapter.queryNoReturn('DELETE FROM AddressBook');
  }

  @override
  Future<void> insertAddressBook(AddressBook data) async {
    await _addressBookInsertionAdapter.insert(data, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAddressBook(AddressBook data) async {
    await _addressBookUpdateAdapter.update(data, OnConflictStrategy.abort);
  }
}
