import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await openDatabase(
    join(await getDatabasesPath(), 'user_info_DB.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_info (userInfo_id INTEGER PRIMARY KEY, user_id INTEGER, first_name TEXT, last_name TEXT, gender TEXT, phone TEXT, address TEXT, city TEXT, state TEXT, zip TEXT, created_at TEXT, updated_at TEXT, deleted_at TEXT)',
      );
    },
    version: 1,
  );

  Future<List<UserInfo>> getUserInfo() async {
    final db = await database;

    final List<Map<String, Object?>> userInfoMaps = await db.query('user_info');

    return [
      for (final {
            'userInfo_id': userInfo_id as int,
            'user_id': user_id as int,
            'first_name': first_name as String,
            'last_name': last_name as String,
            'gender': gender as String,
            'phone': phone as String,
            'address': address as String,
            'city': city as String,
            'state': state as String,
            'zip': zip as String,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in userInfoMaps)
        UserInfo(
            userInfo_id: userInfo_id,
            user_id: user_id,
            first_name: first_name,
            last_name: last_name,
            gender: gender,
            phone: phone,
            address: address,
            city: city,
            state: state,
            zip: zip,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class UserInfo {
  final int userInfo_id;
  final int user_id;
  final String first_name;
  final String last_name;
  final String gender;
  final String phone;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String created_at;
  final String updated_at;
  final String deleted_at;

  UserInfo({
    required this.userInfo_id,
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.gender,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'userInfo_id': userInfo_id,
      'user_id': user_id,
      'first_name': first_name,
      'last_name': last_name,
      'gender': gender,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'zip': zip,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'UserInfo{'
        'userInfo_id: $userInfo_id, '
        'user_id: $user_id, '
        'first_name: $first_name, '
        'last_name: $last_name, '
        'gender: $gender, '
        'phone: $phone, '
        'address: $address, '
        'city: $city, '
        'state: $state, '
        'zip: $zip, '
        'created_at: $created_at, '
        'updated_at: $updated_at, '
        'deleted_at: $deleted_at'
        '}';
  }
}
