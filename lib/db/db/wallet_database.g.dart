// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorWalletDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WalletDatabaseBuilder databaseBuilder(String name) =>
      _$WalletDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WalletDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$WalletDatabaseBuilder(null);
}

class _$WalletDatabaseBuilder {
  _$WalletDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$WalletDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$WalletDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<WalletDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$WalletDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$WalletDatabase extends WalletDatabase {
  _$WalletDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WalletDao? _walletDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Wallet` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `walletName` TEXT, `walletType` TEXT, `walletAddress` TEXT, `walletPublicKey` TEXT, `walletPrivateKey` TEXT, `pwd` TEXT, `pwdTip` TEXT, `createDate` INTEGER, `mnemonic` TEXT, `updateDate` INTEGER, `watch` INTEGER, `walletSelect` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WalletDao get walletDao {
    return _walletDaoInstance ??= _$WalletDao(database, changeListener);
  }
}

class _$WalletDao extends WalletDao {
  _$WalletDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _walletInsertionAdapter = InsertionAdapter(
            database,
            'Wallet',
            (Wallet item) => <String, Object?>{
                  'id': item.id,
                  'walletName': item.walletName,
                  'walletType': item.walletType,
                  'walletAddress': item.walletAddress,
                  'walletPublicKey': item.walletPublicKey,
                  'walletPrivateKey': item.walletPrivateKey,
                  'pwd': item.pwd,
                  'pwdTip': item.pwdTip,
                  'createDate': item.createDate,
                  'mnemonic': item.mnemonic,
                  'updateDate': item.updateDate,
                  'watch': item.watch,
                  'walletSelect': item.walletSelect
                }),
        _walletUpdateAdapter = UpdateAdapter(
            database,
            'Wallet',
            ['id'],
            (Wallet item) => <String, Object?>{
                  'id': item.id,
                  'walletName': item.walletName,
                  'walletType': item.walletType,
                  'walletAddress': item.walletAddress,
                  'walletPublicKey': item.walletPublicKey,
                  'walletPrivateKey': item.walletPrivateKey,
                  'pwd': item.pwd,
                  'pwdTip': item.pwdTip,
                  'createDate': item.createDate,
                  'mnemonic': item.mnemonic,
                  'updateDate': item.updateDate,
                  'watch': item.watch,
                  'walletSelect': item.walletSelect
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Wallet> _walletInsertionAdapter;

  final UpdateAdapter<Wallet> _walletUpdateAdapter;

  @override
  Future<List<Wallet>?> findWalletAll() async {
    return _queryAdapter.queryList('SELECT * FROM Wallet order by id desc',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int?,
            row['walletName'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['walletPublicKey'] as String?,
            row['walletPrivateKey'] as String?,
            row['pwd'] as String?,
            row['pwdTip'] as String?,
            row['createDate'] as int?,
            row['mnemonic'] as String?,
            row['updateDate'] as int?,
            row['watch'] as int?,
            row['walletSelect'] as int?));
  }

  @override
  Future<List<Wallet>?> findWalletPage(int startIndex, int pageSize) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Wallet order by id desc limit ?1,?2',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int?,
            row['walletName'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['walletPublicKey'] as String?,
            row['walletPrivateKey'] as String?,
            row['pwd'] as String?,
            row['pwdTip'] as String?,
            row['createDate'] as int?,
            row['mnemonic'] as String?,
            row['updateDate'] as int?,
            row['watch'] as int?,
            row['walletSelect'] as int?),
        arguments: [startIndex, pageSize]);
  }

  @override
  Future<List<Wallet>?> findWalletByWalletType(String walletType) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Wallet WHERE walletType = ?1 order by id desc',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int?,
            row['walletName'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['walletPublicKey'] as String?,
            row['walletPrivateKey'] as String?,
            row['pwd'] as String?,
            row['pwdTip'] as String?,
            row['createDate'] as int?,
            row['mnemonic'] as String?,
            row['updateDate'] as int?,
            row['watch'] as int?,
            row['walletSelect'] as int?),
        arguments: [walletType]);
  }

  @override
  Future<List<Wallet>?> findWalletByWalletName(String walletName) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Wallet WHERE walletName = ?1 order by id desc',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int?,
            row['walletName'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['walletPublicKey'] as String?,
            row['walletPrivateKey'] as String?,
            row['pwd'] as String?,
            row['pwdTip'] as String?,
            row['createDate'] as int?,
            row['mnemonic'] as String?,
            row['updateDate'] as int?,
            row['watch'] as int?,
            row['walletSelect'] as int?),
        arguments: [walletName]);
  }

  @override
  Future<List<Wallet>?> findWalletByWalletAddress(String walletAddress) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Wallet WHERE walletAddress = ?1 order by id desc',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int?,
            row['walletName'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['walletPublicKey'] as String?,
            row['walletPrivateKey'] as String?,
            row['pwd'] as String?,
            row['pwdTip'] as String?,
            row['createDate'] as int?,
            row['mnemonic'] as String?,
            row['updateDate'] as int?,
            row['watch'] as int?,
            row['walletSelect'] as int?),
        arguments: [walletAddress]);
  }

  @override
  Future<Wallet?> findWalletById(int id) async {
    return _queryAdapter.query('SELECT * FROM Wallet WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int?,
            row['walletName'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['walletPublicKey'] as String?,
            row['walletPrivateKey'] as String?,
            row['pwd'] as String?,
            row['pwdTip'] as String?,
            row['createDate'] as int?,
            row['mnemonic'] as String?,
            row['updateDate'] as int?,
            row['watch'] as int?,
            row['walletSelect'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> deleteWalletById(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Wallet  WHERE  id = ?1', arguments: [id]);
  }

  @override
  Future<void> deleteWallet() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Wallet');
  }

  @override
  Future<Wallet?> findWalletByPwdAddress(
      String pwd, String walletAddress) async {
    return _queryAdapter.query(
        'SELECT * FROM Wallet WHERE pwd = ?1 and walletAddress = ?2',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int?,
            row['walletName'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['walletPublicKey'] as String?,
            row['walletPrivateKey'] as String?,
            row['pwd'] as String?,
            row['pwdTip'] as String?,
            row['createDate'] as int?,
            row['mnemonic'] as String?,
            row['updateDate'] as int?,
            row['watch'] as int?,
            row['walletSelect'] as int?),
        arguments: [pwd, walletAddress]);
  }

  @override
  Future<Wallet?> findWalletByPrivateKeyAddress(
      String walletPrivateKey, String walletAddress) async {
    return _queryAdapter.query(
        'SELECT * FROM Wallet WHERE walletPrivateKey = ?1 and walletAddress = ?2',
        mapper: (Map<String, Object?> row) => Wallet(row['id'] as int?, row['walletName'] as String?, row['walletType'] as String?, row['walletAddress'] as String?, row['walletPublicKey'] as String?, row['walletPrivateKey'] as String?, row['pwd'] as String?, row['pwdTip'] as String?, row['createDate'] as int?, row['mnemonic'] as String?, row['updateDate'] as int?, row['watch'] as int?, row['walletSelect'] as int?),
        arguments: [walletPrivateKey, walletAddress]);
  }

  @override
  Future<List<Wallet>?> findWalletBySelect() async {
    return _queryAdapter.queryList(
        'SELECT * FROM Wallet order by walletSelect desc,id asc',
        mapper: (Map<String, Object?> row) => Wallet(
            row['id'] as int?,
            row['walletName'] as String?,
            row['walletType'] as String?,
            row['walletAddress'] as String?,
            row['walletPublicKey'] as String?,
            row['walletPrivateKey'] as String?,
            row['pwd'] as String?,
            row['pwdTip'] as String?,
            row['createDate'] as int?,
            row['mnemonic'] as String?,
            row['updateDate'] as int?,
            row['watch'] as int?,
            row['walletSelect'] as int?));
  }

  @override
  Future<void> insertWallet(Wallet data) async {
    await _walletInsertionAdapter.insert(data, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateWallet(Wallet data) async {
    await _walletUpdateAdapter.update(data, OnConflictStrategy.abort);
  }
}
