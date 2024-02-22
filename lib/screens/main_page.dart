import 'package:flutter/material.dart';

import 'package:inventory_app/screens/fason_page_two.dart';

import 'package:inventory_app/screens/stok_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.inventory_2_sharp), label: "Stok"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.drive_file_rename_outline_sharp), label: "Fason")
  ];
  List pages = [
    const PageThree(),
    const FasonPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: navItems,
          selectedFontSize: 15),
    );
  }
}
