// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_core_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorWeatherCoreDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherCoreDatabaseBuilder databaseBuilder(String name) =>
      _$WeatherCoreDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherCoreDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$WeatherCoreDatabaseBuilder(null);
}

class _$WeatherCoreDatabaseBuilder {
  _$WeatherCoreDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$WeatherCoreDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$WeatherCoreDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<WeatherCoreDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$WeatherCoreDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$WeatherCoreDatabase extends WeatherCoreDatabase {
  _$WeatherCoreDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WeatherCoreModelDao? _weatherCoreModelDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `weather_core_model` (`id` INTEGER NOT NULL, `location` TEXT NOT NULL, `status` TEXT NOT NULL, `icon` TEXT NOT NULL, `temp` TEXT NOT NULL, `humidity` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WeatherCoreModelDao get weatherCoreModelDao {
    return _weatherCoreModelDaoInstance ??=
        _$WeatherCoreModelDao(database, changeListener);
  }
}

class _$WeatherCoreModelDao extends WeatherCoreModelDao {
  _$WeatherCoreModelDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _weatherCoreModelInsertionAdapter = InsertionAdapter(
            database,
            'weather_core_model',
            (WeatherCoreModel item) => <String, Object?>{
                  'id': item.id,
                  'location': item.location,
                  'status': item.status,
                  'icon': item.icon,
                  'temp': item.temp,
                  'humidity': item.humidity
                }),
        _weatherCoreModelDeletionAdapter = DeletionAdapter(
            database,
            'weather_core_model',
            ['id'],
            (WeatherCoreModel item) => <String, Object?>{
                  'id': item.id,
                  'location': item.location,
                  'status': item.status,
                  'icon': item.icon,
                  'temp': item.temp,
                  'humidity': item.humidity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WeatherCoreModel> _weatherCoreModelInsertionAdapter;

  final DeletionAdapter<WeatherCoreModel> _weatherCoreModelDeletionAdapter;

  @override
  Future<List<WeatherCoreModel>> getWeatherCoreModels() async {
    return _queryAdapter.queryList('SELECT * FROM city',
        mapper: (Map<String, Object?> row) => WeatherCoreModel(
            id: row['id'] as int,
            location: row['location'] as String,
            status: row['status'] as String,
            icon: row['icon'] as String,
            temp: row['temp'] as String,
            humidity: row['humidity'] as String));
  }

  @override
  Future<void> add(WeatherCoreModel city) async {
    await _weatherCoreModelInsertionAdapter.insert(
        city, OnConflictStrategy.abort);
  }

  @override
  Future<void> remove(WeatherCoreModel city) async {
    await _weatherCoreModelDeletionAdapter.delete(city);
  }
}
