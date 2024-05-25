import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'category_BD.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE categories(category_id INTEGER PRIMARY KEY, name_category TEXT, description TEXT,  created_at TEXT, update_at TEXT, deleted_at TEXT)',
      );
    },
    version: 1,
  );

  Future<List<Category>> getCategory() async {
    final db = await database;
    final List<Map<String, Object?>> categoryMaps =
        await db.query('categories');
    return [
      for (final {
            'category_id': category_id as int,
            'name_category': name_category as String,
            'description': description as String,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in categoryMaps)
        Category(
            category_id: category_id,
            name_category: name_category,
            description: description,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }

  Future<void> insertCategory(Category category) async {
    final db = await database;
    await db.insert(
      'categories',
      category.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateCategory(Category category) async {
    final db = await database;
    await db.update('categories', category.toMap(),
        where: 'category=?', whereArgs: [category.category_id]);
  }

  Future<void> deteleCategory(Category category) async {
    final db = await database;
    await db.delete('categories',
        where: 'category_id =?', whereArgs: [category.category_id]);
  }
}

class Category {
  final int category_id;
  final String name_category;
  final String description;
  final String created_at;
  final String updated_at;
  final String deleted_at;

  Category({
    required this.category_id,
    required this.name_category,
    required this.description,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'category_id': category_id,
      'name_category': name_category,
      'description': description,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'Category{'
        'category_id: $category_id, '
        'name_category: $name_category, '
        'description: $description, '
        'created_at: $created_at, '
        'updated_at: $updated_at, '
        'deleted_at: $deleted_at}';
  }
}
