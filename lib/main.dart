import 'package:bottombar/page1.dart';
import 'package:bottombar/page2.dart';
import 'package:bottombar/page3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final List<Widget> pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bottom bar"),
        ),
        body: Center(
          child: IndexedStack(
            index: currentIndex,
            children: pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: Colors.black,
              ),
              label: "call",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera,
                color: Colors.black,
              ),
              label: "Camera",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: Colors.black,
              ),
              label: "message",
            ),
          ],
        ),
      ),
    );
  }
}
