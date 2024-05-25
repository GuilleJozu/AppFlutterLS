import 'dart:async';
import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'product_DB.db'),
      onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE products(product_id INTEGER PRIMARY KEY, name_product TEXT, description TEXT, price REAL, stock INTEGER, image TEXT, category_id TEXT,  created_at TEXT, update_at TEXT, deleted_at TEXT )',
    );
  });

  Future<List<Product>> getProduct() async {
    final db = await database;
    final List<Map<String, Object?>> productMap = await db.query('producs');

    return [
      for (final {
            'product_id': product_id as int,
            'name_product': name_product as String,
            'description': description as String,
            'price': price as Float,
            'stock': stock as int,
            'image': image as String,
            'category_id': category_id as int,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in productMap)
        Product(
            product_id: product_id,
            name_product: name_product,
            description: description,
            price: price,
            stock: stock,
            image: image,
            category_id: category_id,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class Product {
  final int product_id;
  final String name_product;
  final String description;
  final Float price;
  final int stock;
  final String image;
  final int category_id;
  final String created_at;
  final String updated_at;
  final String deleted_at;

  Product({
    required this.product_id,
    required this.name_product,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
    required this.category_id,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });
  Map<String, Object> toMap() {
    return {
      'product_id': product_id,
      'name_product': name_product,
      'description': description,
      'price': price,
      'stock': stock,
      'image': image,
      'category_id': category_id,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'Product{'
        'product_id: $product_id,'
        'name_product: $name_product,'
        'description: $description,'
        'price: $price,'
        'stock: $stock,'
        'image: $image,'
        'category_id: $category_id,'
        'created_at:$created_at,'
        'updated_at:$updated_at,'
        'deleted_at: $deleted_at}';
  }
}
