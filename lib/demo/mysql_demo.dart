import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';
//import 'package:sqljocky5/sqljocky.dart';


Future main() async{
  final conn = await MySqlConnection.connect(new ConnectionSettings(
    host: '10.15.147.11', port: 12345, user: 'root', password: 'root', db: 'design_soft_2'));
  await conn.query("SELECT * FROM users").then((results) {
    results.forEach((row) {
      //使用下标查询结果
      debugPrint('${row[1]},${row[3]}');
      print('${row[1]},${row[3]}');
    });
  });
}

