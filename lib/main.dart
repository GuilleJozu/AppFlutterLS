import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Iniciar Sesión', home: LoginPage());
  }
}
