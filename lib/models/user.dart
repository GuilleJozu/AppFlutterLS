import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'user_DB.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(user_id INTEGER PRIMA, username , email TEXT, password TEXT, created_at TEXT, update_at TEXT, deleted_at TEXT )',
      );
    },
    version: 1,
  );

  Future<List<User>> getUser() async {
    final db = await database;

    final List<Map<String, Object?>> userMaps = await db.query('users');

    return [
      for (final {
            'user_id': user_id as int,
            'username': username as String,
            'email': email as String,
            'password': password as String,
            'created_at': create_at as String,
            'update_at': updated_at as String,
            'delete_at': deleted_at as String,
          } in userMaps)
        User(
            user_id: user_id,
            username: username,
            email: email,
            password: password,
            create_at: create_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class User {
  final int user_id;
  final String username;
  final String email;
  final String password;
  final String create_at;
  final String updated_at;
  final String deleted_at;

  User({
    required this.user_id,
    required this.username,
    required this.email,
    required this.password,
    required this.create_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'user_id': user_id,
      'username': username,
      'email': email,
      'password': password,
      'created_at': create_at,
      'update_at': updated_at,
      'delete_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'User{'
        'user_id: $user_id,'
        'username: $username, '
        'email: $email, '
        'password: $password, '
        'created_at: $create_at, '
        'updated_at: $updated_at,'
        'deleted_at: $deleted_at}';
  }
}
