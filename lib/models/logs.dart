import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'log_DB.dc'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE logs(log_id INTEGER PRIMARY KEY, user_id INTEGER, action TEXT,  created_at TEXT, updated_at TEXT, deleted_at TEXT)');
  }, version: 1);

  Future<List<Log>> getLog() async {
    final db = await database;
    final List<Map<String, Object?>> logMaps = await db.query('logs');

    return [
      for (final {
            'logs_id': log_id as int,
            'user_id': user_id as int,
            'action': action as String,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in logMaps)
        Log(
            log_id: log_id,
            user_id: user_id,
            action: action,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class Log {
  final int log_id;
  final int user_id;
  final String action;
  final String created_at;
  final String updated_at;
  final String deleted_at;

  Log({
    required this.log_id,
    required this.user_id,
    required this.action,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'logs_id': log_id,
      'user_id': user_id,
      'action': action,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'Log{'
        'logs_id: $log_id,'
        'user_id: $user_id,'
        'action: $action,'
        'created_at: $created_at,'
        'updated_at: $updated_at,'
        'deleted_at: $deleted_at}';
  }
}
