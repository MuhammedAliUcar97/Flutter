import 'package:flutter/material.dart';
import 'package:myapp/screns/Calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        
        primarySwatch: Colors.deepPurple,
      ),
      home: const Ortalamatik(),
    );
  }
}
  
