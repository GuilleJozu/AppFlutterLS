import 'dart:async';
import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'venta_DB.dc'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE ventas(venta_id INTEGER PRIMARY KEY, total REAL, payment_method TEXT, user_id INTEGER,  created_at TEXT, updated_at TEXT, deleted_at TEXT)');
  }, version: 1);

  Future<List<Venta>> getVenta() async {
    final db = await database;
    final List<Map<String, Object?>> ventaMaps = await db.query('ventas');

    return [
      for (final {
            'venta_id': venta_id as int,
            'total': total as Float,
            'payment_method': payment_method as String,
            'user_id': user_id as int,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in ventaMaps)
        Venta(
            venta_id: venta_id,
            total: total,
            payment_method: payment_method,
            user_id: user_id,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class Venta {
  final int venta_id;
  final Float total;
  final String payment_method;
  final int user_id;
  final String created_at;
  final String updated_at;
  final String deleted_at;
  Venta({
    required this.venta_id,
    required this.total,
    required this.payment_method,
    required this.user_id,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'venta_id': venta_id,
      'total': total,
      'payment_method': payment_method,
      'user_id': user_id,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'Venta{'
        'venta_id: $venta_id,'
        'total: $total,'
        'payment_method: $payment_method,'
        'user_id: $user_id,'
        'created_at: $created_at,'
        'updated_at: $updated_at,'
        'deleted_at: $deleted_at}';
  }
}
