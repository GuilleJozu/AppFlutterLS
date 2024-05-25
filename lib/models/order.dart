import 'dart:async';
import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'order_DB.dc'),
      onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE orders(order_id INT PRIMARY KEY, user_id INT, order_date TEXT, status TEXT, total_amount REAL, created_at TEXT, updated_at TEXT, deleted_at TEXT)',
    );
  }, version: 1);

  Future<List<Order>> getOrder() async {
    final db = await database;
    final List<Map<String, Object?>> orderMaps = await db.query('ordes');

    return [
      for (final {
            'order_id': order_id as int,
            'user_id': user_id as int,
            'order_date': order_date as String,
            'status': status as String,
            'total_amount': total_amount as Float,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String
          } in orderMaps)
        Order(
            order_id: order_id,
            user_id: user_id,
            order_date: order_date,
            status: status,
            total_amount: total_amount,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class Order {
  final int order_id;
  final int user_id;
  final String order_date;
  final String status;
  final Float total_amount;
  final String created_at;
  final String updated_at;
  final String deleted_at;

  Order({
    required this.order_id,
    required this.user_id,
    required this.order_date,
    required this.status,
    required this.total_amount,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'order_id': order_id,
      'user_id': user_id,
      'order_date': order_date,
      'status': status,
      'total_amount': total_amount,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'Order{'
        'order_id: $order_id,'
        'user_id: $user_id,'
        'order_date: $order_date,'
        'status: $status,'
        'total_amount: $total_amount,'
        'created_at: $created_at,'
        'updated_at: $updated_at,'
        'deleted_at: $deleted_at}';
  }
}
