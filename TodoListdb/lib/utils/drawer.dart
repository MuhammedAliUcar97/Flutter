import 'package:flutter/material.dart';
import 'package:myapp/Screens/todolist_db.dart';
import 'package:myapp/screens/calculator.dart';
import 'package:myapp/screens/nalan.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(

            decoration: BoxDecoration(
              color: Colors.purple,
            ),

            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("./assets/images/img.png"),
            ),
          ),
          ListTile(
            title: const Text('Todo List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const mysql()),
              );
            },
          ),
          ListTile(
            title: const Text('calculator'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Calculator()),
              );
            },
          ),
          ListTile(
            title: const Text('nalan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Nalan()),
              );
            },
          ),
        ],
      ),
    );
  }
}
