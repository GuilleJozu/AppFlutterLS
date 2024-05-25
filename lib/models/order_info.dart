import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      openDatabase(join(await getDatabasesPath(), 'order_info_DB.db'),
          onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE ordersInfo(orderInfo_id INTEGER PRIMARY KEY, order_id INTEGER, first_name TEXT, exp_date TEXT, cvv TEXT, total_amt REAL)');
  }, version: 1);

  Future<List<OrderInfo>> getOrderInfo() async {
    final db = await database;

    final List<Map<String, Object?>> orderInfoMap =
        await db.query('ordersInfo');

    return [
      for (final {
            'order_info_id': order_info_id as int,
            'order_id': order_id as int,
            'first_name': first_name as String,
            'exp_date': exp_date as String,
            'cvv': cvv as int,
            'total_amt': total_amt as double,
          } in orderInfoMap)
        OrderInfo(
            order_info_id: order_info_id,
            order_id: order_id,
            first_name: first_name,
            exp_date: exp_date,
            cvv: cvv,
            total_amt: total_amt)
    ];
  }
}

class OrderInfo {
  final int order_info_id;
  final int order_id;
  final String first_name;
  final String exp_date;
  final int cvv;
  final double total_amt;

  OrderInfo({
    required this.order_info_id,
    required this.order_id,
    required this.first_name,
    required this.exp_date,
    required this.cvv,
    required this.total_amt,
  });

  Map<String, Object> toMap() {
    return {
      'order_info_id': order_info_id,
      'order_id': order_id,
      'first_name': first_name,
      'exp_date': exp_date,
      'cvv': cvv,
      'total_amt': total_amt,
    };
  }

  @override
  String toString() {
    return 'OrderInfo{'
        'order_info_id: $order_info_id, '
        'order_id: $order_id, '
        'first_name: $first_name, '
        'exp_date: $exp_date, '
        'cvv: $cvv, '
        'total_amt: $total_amt}';
  }
}
