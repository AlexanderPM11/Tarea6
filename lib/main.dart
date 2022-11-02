import 'package:flutter/material.dart';

import 'Pages/AboutMe.dart';
import 'Pages/SerchUniversity.dart';
import 'Pages/PersonAge.dart';
import 'Pages/PersonGender.dart';
import 'Pages/HomePage.dart';
import 'Pages/Weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    PersonGender(),
    PersonAge(),
    SerchUniversity(),
    Weather(),
    AboutMe()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Person gender"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: "Age person"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.school), label: "University"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.umbrella_rounded), label: "Weather"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.badge), label: "Portfolio"),
          ],
        ));
  }
}
