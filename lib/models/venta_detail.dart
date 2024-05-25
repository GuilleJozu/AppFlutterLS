import 'dart:async';
import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      openDatabase(join(await getDatabasesPath(), 'venta_detail_DB.dc'),
          onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE ventas_detail(venta_detail_id  INTEGER PRIMARY KEY, venta_id INTEGER, user_id INTEGER, product_id INTEGER, quantity INTEGER, price REAL,  created_at TEXT, updated_at TEXT, deleted_at TEXT)');
  }, version: 1);

  Future<List<VentaDetail>> getVentaDetail() async {
    final db = await database;
    final List<Map<String, Object?>> venta_detailMaps =
        await db.query('ventas_detal');

    return [
      for (final {
            'venta_detail_id': venta_detail_id as int,
            'venta_id': venta_id as int,
            'user_id': user_id as int,
            'product_id': product_id as int,
            'quantity': quantity as int,
            'price': price as Float,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in venta_detailMaps)
        VentaDetail(
            venta_detail_id: venta_detail_id,
            venta_id: venta_id,
            user_id: user_id,
            product_id: product_id,
            quantity: quantity,
            price: price,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class VentaDetail {
  final int venta_detail_id;
  final int venta_id;
  final int user_id;
  final int product_id;
  final int quantity;
  final Float price;
  final String created_at;
  final String updated_at;
  final String deleted_at;

  VentaDetail({
    required this.venta_detail_id,
    required this.venta_id,
    required this.user_id,
    required this.product_id,
    required this.quantity,
    required this.price,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'venta_detail_id': venta_detail_id,
      'venta_id': venta_id,
      'user_id': user_id,
      'product_id': product_id,
      'quantity': quantity,
      'price': price,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'VentaDetail{'
        'venta_detail_id: $venta_detail_id,'
        'venta_id: $venta_id,'
        'user_id: $user_id,'
        'product_id: $product_id,'
        'quantity: $quantity,'
        'price: $price,'
        'created_at: $created_at,'
        'updated_at: $updated_at,'
        'deleted_at: $deleted_at}';
  }
}
