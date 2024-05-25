import 'dart:async';
import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      openDatabase(join(await getDatabasesPath(), 'order_product_DB.dc'),
          onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE ordersProduct(order_product_id INTEGER PRIMARY KEY, order_id INTEGER, product_id INTEGER, quantity INTEGER, unit_price REAL,  created_at TEXT, updated_at TEXT, deleted_at TEXT)',
    );
  }, version: 1);

  Future<List<Order_Profuct>> getOrderProduct() async {
    final db = await database;
    final List<Map<String, Object?>> order_produtMaps =
        await db.query('orders_product');

    return [
      for (final {
            'order_product_id': order_product_id as int,
            'order_id': order_id as int,
            'product_id': product_id as int,
            'quantity': quantity as int,
            'unit_price': unit_price as Float,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in order_produtMaps)
        Order_Profuct(
            order_product_id: order_product_id,
            order_id: order_id,
            product_id: product_id,
            quantity: quantity,
            unit_price: unit_price,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class Order_Profuct {
  final int order_product_id;
  final int order_id;
  final int product_id;
  final int quantity;
  final Float unit_price;
  final String created_at;
  final String updated_at;
  final String deleted_at;

  Order_Profuct({
    required this.order_product_id,
    required this.order_id,
    required this.product_id,
    required this.quantity,
    required this.unit_price,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'order_product_id': order_product_id,
      'order_id': order_id,
      'product_id': product_id,
      'quantity': quantity,
      'unit_price': unit_price,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'Order_Product{'
        'order_product_id: $order_product_id,'
        'order_id: $order_id,'
        'product_id: $product_id,'
        'quantity: $quantity,'
        'unit_price: $unit_price,'
        'created_at: $created_at,'
        'updated_at: $updated_at,'
        'deleted_at: $deleted_at}';
  }
}
