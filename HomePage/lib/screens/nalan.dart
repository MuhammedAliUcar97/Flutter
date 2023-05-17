import 'package:flutter/material.dart';
import 'package:myapp/Screens/todolist_db.dart';
import 'package:myapp/screens/calculator.dart';
import 'package:myapp/utils/drawer.dart';

class Nalan extends StatelessWidget {
  const Nalan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(

        foregroundColor: Colors.purple,
        title: const Text("Nalan"),
        actions: const [
          Icon(Icons.settings),
          SizedBox(
            width: 4,
          )
        ],
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box("N", Colors.blue[900]!),
                box("A", Colors.blue[800]!),
                box("L", Colors.blue[700]!),
                box("A", Colors.blue[600]!),
                box("N", Colors.blue[500]!),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box("A", Colors.blue[800]!),
                box("A", Colors.blue[600]!),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box("L", Colors.blue[700]!),
                box("L", Colors.blue[700]!),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box("A", Colors.blue[600]!),
                box("A", Colors.blue[800]!),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                box("N", Colors.blue[500]!),
                box("A", Colors.blue[600]!),
                box("L", Colors.blue[700]!),
                box("A", Colors.blue[800]!),
                box("N", Colors.blue[900]!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget box(String word, Color color) {
  return Container(
    color: color,
    width: 84,
    height: 166.4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          word,
          textAlign: TextAlign.center,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
