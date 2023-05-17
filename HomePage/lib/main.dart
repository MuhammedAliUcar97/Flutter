import 'package:flutter/material.dart';
import 'package:myapp/screens/calculator.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/nalan.dart';
import 'Screens/todolist_db.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: '/',
      routes: {
        "/todolist_db": (context) => const mysql(),
        "/": (context) => const Home(),
        "/nalan": (context) => const Nalan(),
        "/calculator": (context) => const Calculator(),
      },
    );
  }
}
