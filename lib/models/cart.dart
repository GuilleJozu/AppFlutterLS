import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'cart_DB.dc'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE carts(cart_id INTEGER PRIMARY KEY, user_id INTEGER, product_id INTEGER, quantity INTEGER,  created_at TEXT, updated_at TEXT, deleted_at TEXT)');
  }, version: 1);

  Future<List<Cart>> getCart() async {
    final db = await database;
    final List<Map<String, Object?>> cartMaps = await db.query('carts');

    return [
      for (final {
            'cart_id': cart_id as int,
            'user_id': user_id as int,
            'product_id': product_id as int,
            'quantity': quantity as int,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in cartMaps)
        Cart(
            cart_id: cart_id,
            user_id: user_id,
            product_id: product_id,
            quantity: quantity,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class Cart {
  final int cart_id;
  final int user_id;
  final int product_id;
  final int quantity;
  final String created_at;
  final String updated_at;
  final String deleted_at;

  Cart({
    required this.cart_id,
    required this.user_id,
    required this.product_id,
    required this.quantity,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'cart_id': cart_id,
      'user_id': user_id,
      'product_id': product_id,
      'quantity': quantity,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'Cart{'
        'cart_id: $cart_id,'
        'user_id: $user_id,'
        'product_id: $product_id,'
        'quantity: $quantity,'
        'created_at: $created_at,'
        'updated_at: $updated_at,'
        'deleted_at: $deleted_at}';
  }
}
