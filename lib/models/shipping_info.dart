import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      openDatabase(join(await getDatabasesPath(), 'shipping_info_DB.dc'),
          onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE shippings_info(shipping_info_id PRIMARY KEY, order_id INTEGER, first_name TEXT, last_name TEXT, address TEXT, city TEXT, state TETXT, zip TEXT',
    );
  }, version: 1);


  Future<List<Shipping_Info>> getShipping_Info() async {
    final db = await database;
    final List<Map<String, Object?>> shipping_infoMaps =
        await db.query('shippings_info');

    return [
      for (final {
            'shipping_info_id': shipping_info_id as int,
            'order_id': order_id as int,
            'first_name': first_name as String,
            'last_name': last_name as String,
            'address': address as String,
            'city': city as String,
            'state': state as String,
            'zip': zip as String,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in shipping_infoMaps)
        Shipping_Info(
            shipping_info_id: shipping_info_id,
            order_id: order_id,
            first_name: first_name,
            last_name: last_name,
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

class Shipping_Info {
  final int shipping_info_id;
  final int order_id;
  final String first_name;
  final String last_name;
  final String address;
  final String city;
  final String state;
  final String zip;
  final String created_at;
  final String updated_at;
  final String deleted_at;

  Shipping_Info({
    required this.shipping_info_id,
    required this.order_id,
    required this.first_name,
    required this.last_name,
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
      'shipping_info_id': shipping_info_id,
      'order_id': order_id,
      'first_name': first_name,
      'last_name': last_name,
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
    return 'Shipping_Info{'
        'shipping_info_id: $shipping_info_id,'
        'order_id: $order_id,'
        'first_name: $first_name,'
        'last_name: $last_name,'
        'address: $address,'
        'city: $city,'
        'state: $state,'
        'zip: $zip,'
        'created_at: $created_at,'
        'updated_at: $updated_at,'
        'deleted_at: $deleted_at}';
  }
}
