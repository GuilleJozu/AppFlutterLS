import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      openDatabase(join(await getDatabasesPath(), 'payment_info_DB.dc'),
          onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE payments_info(payment_info_id INTEGER PRIMARY KEY, user_id INTEGER, card_name TEXT, card_number TEXT, exp_date TEXT, cvv INTEGER, created_at TEXT, updated_at TEXT, deleted_at TEXT )');
  }, version: 1);

  Future<List<Payment_Info>> getPayment_Info() async {
    final db = await database;
    final List<Map<String, Object?>> payment_infoMaps =
        await db.query('payments_info');

    return [
      for (final {
            'payment_info_id': payment_info_id as int,
            'user_id': user_id as int,
            'card_name': card_name as String,
            'card_number': card_number as String,
            'exp_date': exp_date as String,
            'cvv': cvv as int,
            'created_at': created_at as String,
            'updated_at': updated_at as String,
            'deleted_at': deleted_at as String,
          } in payment_infoMaps)
        Payment_Info(
            payment_info_id: payment_info_id,
            user_id: user_id,
            card_name: card_name,
            card_number: card_number,
            exp_date: exp_date,
            cvv: cvv,
            created_at: created_at,
            updated_at: updated_at,
            deleted_at: deleted_at)
    ];
  }
}

class Payment_Info {
  final int payment_info_id;
  final int user_id;
  final String card_name;
  final String card_number;
  final String exp_date;
  final int cvv;
  final String created_at;
  final String updated_at;
  final String deleted_at;
  Payment_Info({
    required this.payment_info_id,
    required this.user_id,
    required this.card_name,
    required this.card_number,
    required this.exp_date,
    required this.cvv,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  Map<String, Object> toMap() {
    return {
      'payment_info_id': payment_info_id,
      'user_id': user_id,
      'card_name': card_name,
      'card_number': card_number,
      'exp_date': exp_date,
      'cvv': cvv,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  @override
  String toString() {
    return 'PaymentInfo{'
        'payment_info_id: $payment_info_id,'
        'user_id: $user_id,'
        'card_name: $card_name,'
        'card_number: $card_number,'
        'exp_date: $exp_date,'
        'cvv: $cvv,'
        'created_at: $created_at,'
        'updated_at: $updated_at,'
        'deleted_at: $deleted_at}';
  }
}
