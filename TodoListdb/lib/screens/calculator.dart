import 'package:flutter/material.dart';
import 'package:myapp/Screens/todolist_db.dart';
import 'package:myapp/screens/nalan.dart';
import 'package:myapp/utils/drawer.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  num sayi1 = 0, sayi2 = 0, toplam = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      
            floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              toplam = sayi1 + sayi2;
            });
          }),
      appBar: AppBar(
        title: const Text("calculator"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
            child: TextFormField(
              onChanged: (value) {
                sayi1 = int.parse(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
            child: TextFormField(
              onChanged: (value) {
                sayi2 = int.parse(value);
              },
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.topCenter,
            child: Text(
              "$toplam",
              style: const TextStyle(fontSize: 40, color: Colors.brown),
              textAlign: TextAlign.left,
            ),
          ))
        ],
      ),
    );
  }
}
