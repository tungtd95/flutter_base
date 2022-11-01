// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorWeatherDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherDatabaseBuilder databaseBuilder(String name) =>
      _$WeatherDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$WeatherDatabaseBuilder(null);
}

class _$WeatherDatabaseBuilder {
  _$WeatherDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$WeatherDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$WeatherDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<WeatherDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$WeatherDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$WeatherDatabase extends WeatherDatabase {
  _$WeatherDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WeatherDao? _weatherDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
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
            'CREATE TABLE IF NOT EXISTS `City` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `country` TEXT, `state` TEXT, `lat` REAL, `lon` REAL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WeatherDao get weatherDao {
    return _weatherDaoInstance ??= _$WeatherDao(database, changeListener);
  }
}

class _$WeatherDao extends WeatherDao {
  _$WeatherDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _cityInsertionAdapter = InsertionAdapter(
            database,
            'City',
            (City item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'country': item.country,
                  'state': item.state,
                  'lat': item.lat,
                  'lon': item.lon
                },
            changeListener),
        _cityDeletionAdapter = DeletionAdapter(
            database,
            'City',
            ['id'],
            (City item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'country': item.country,
                  'state': item.state,
                  'lat': item.lat,
                  'lon': item.lon
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<City> _cityInsertionAdapter;

  final DeletionAdapter<City> _cityDeletionAdapter;

  @override
  Stream<List<City>> getCitiesStream() {
    return _queryAdapter.queryListStream('SELECT * FROM city',
        mapper: (Map<String, Object?> row) => City(
            id: row['id'] as int?,
            name: row['name'] as String?,
            country: row['country'] as String?,
            state: row['state'] as String?,
            lat: row['lat'] as double?,
            lon: row['lon'] as double?),
        queryableName: 'City',
        isView: false);
  }

  @override
  Future<List<City>> getCitiesOneShot() async {
    return _queryAdapter.queryList('SELECT * FROM city',
        mapper: (Map<String, Object?> row) => City(
            id: row['id'] as int?,
            name: row['name'] as String?,
            country: row['country'] as String?,
            state: row['state'] as String?,
            lat: row['lat'] as double?,
            lon: row['lon'] as double?));
  }

  @override
  Future<City?> getCityById(int cityId) async {
    return _queryAdapter.query('SELECT * FROM city WHERE id=?1',
        mapper: (Map<String, Object?> row) => City(
            id: row['id'] as int?,
            name: row['name'] as String?,
            country: row['country'] as String?,
            state: row['state'] as String?,
            lat: row['lat'] as double?,
            lon: row['lon'] as double?),
        arguments: [cityId]);
  }

  @override
  Future<void> add(City city) async {
    await _cityInsertionAdapter.insert(city, OnConflictStrategy.abort);
  }

  @override
  Future<void> remove(City city) async {
    await _cityDeletionAdapter.delete(city);
  }
}
