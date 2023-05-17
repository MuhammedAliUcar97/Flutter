import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int selectedIndex = 0;
  List<Widget> bodylist = [
    const Text('anasayfa'),
    const Text('kurumsal'),
    const Text('iletisim'),
    const Text('ayarlar'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: selectedIndex == 0 ? Colors.purple : Colors.black),
              label: 'anasayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.open_in_new_rounded,
                  color: selectedIndex == 1 ? Colors.purple : Colors.black),
              label: 'Kurumsal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone,
                  color: selectedIndex == 2 ? Colors.purple : Colors.black),
              label: ' Iletisim',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: selectedIndex == 3 ? Colors.purple : Colors.black),
              label: 'Ayarlar',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          }),
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Hosgeldiniz!"),
      ),
      body: Center(
        child: bodylist[selectedIndex],
      ),
    );
  }
}
