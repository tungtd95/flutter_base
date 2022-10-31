// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_module_1_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorWeatherModule1Database {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherModule1DatabaseBuilder databaseBuilder(String name) =>
      _$WeatherModule1DatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherModule1DatabaseBuilder inMemoryDatabaseBuilder() =>
      _$WeatherModule1DatabaseBuilder(null);
}

class _$WeatherModule1DatabaseBuilder {
  _$WeatherModule1DatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$WeatherModule1DatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$WeatherModule1DatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<WeatherModule1Database> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$WeatherModule1Database();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$WeatherModule1Database extends WeatherModule1Database {
  _$WeatherModule1Database([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WeatherModule1Dao? _weatherModule1DaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `weather_module_1_model` (`id` INTEGER NOT NULL, `location` TEXT NOT NULL, `status` TEXT NOT NULL, `icon` TEXT NOT NULL, `temp` TEXT NOT NULL, `humidity` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WeatherModule1Dao get weatherModule1Dao {
    return _weatherModule1DaoInstance ??=
        _$WeatherModule1Dao(database, changeListener);
  }
}

class _$WeatherModule1Dao extends WeatherModule1Dao {
  _$WeatherModule1Dao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _weatherModule1ModelInsertionAdapter = InsertionAdapter(
            database,
            'weather_module_1_model',
            (WeatherModule1Model item) => <String, Object?>{
                  'id': item.id,
                  'location': item.location,
                  'status': item.status,
                  'icon': item.icon,
                  'temp': item.temp,
                  'humidity': item.humidity
                }),
        _weatherModule1ModelDeletionAdapter = DeletionAdapter(
            database,
            'weather_module_1_model',
            ['id'],
            (WeatherModule1Model item) => <String, Object?>{
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

  final InsertionAdapter<WeatherModule1Model>
      _weatherModule1ModelInsertionAdapter;

  final DeletionAdapter<WeatherModule1Model>
      _weatherModule1ModelDeletionAdapter;

  @override
  Future<List<WeatherModule1Model>> getWeather1s() async {
    return _queryAdapter.queryList('SELECT * FROM city',
        mapper: (Map<String, Object?> row) => WeatherModule1Model(
            id: row['id'] as int,
            location: row['location'] as String,
            status: row['status'] as String,
            icon: row['icon'] as String,
            temp: row['temp'] as String,
            humidity: row['humidity'] as String));
  }

  @override
  Future<void> add(WeatherModule1Model city) async {
    await _weatherModule1ModelInsertionAdapter.insert(
        city, OnConflictStrategy.abort);
  }

  @override
  Future<void> remove(WeatherModule1Model city) async {
    await _weatherModule1ModelDeletionAdapter.delete(city);
  }
}
