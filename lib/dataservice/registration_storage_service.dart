import 'dart:async';

import 'package:fallvilt/dataservice/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class RegistrationStorageService extends IRegistrationStorageService {
  static const _databasename = 'fallvilt_database.db';
  static const _version = 2;
  static Database? _database;
  String? path;
  // final _logger = serviceLocator<ILoggerService>();

  RegistrationStorageService() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<Database> get database async {
    if (_database != null) return _database ?? await initDatabase();
    _database = await initDatabase();
    return _database ?? await initDatabase();
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), _databasename);
    return await openDatabase(path,
        version: _version, onOpen: (db) {}, onConfigure: _onConfigure, onUpgrade: _onUpgrade, onCreate: _onCreate);
  }

  _onConfigure(Database db) async {
    // Add support for cascade delete
    await db.execute("PRAGMA foreign_keys = ON");
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (newVersion > oldVersion) {
      //Ved endringer i databasen legg de her.
      //F.eks hvis det legges til en øvelse, kjør
      //await db.execute(exerciseScript);
    }
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    try {
      String registrationScript = RegistrationConstants.script;

      await db.execute(registrationScript);
    } catch (error, stack) {
      // _logger.logError(error, stack);
      return Future.value(null);
    }
  }

  @override
  Future<bool> addRegistration(Registration registration) async {
    final Database db = await database;
    await db
        .insert(
      RegistrationConstants.tableName,
      registration.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    )
        .catchError((error, stack) {
      return Future.value(0);
    });

    return true;
  }
}

abstract class IRegistrationStorageService {
  Future<bool> addRegistration(Registration registration);
}
