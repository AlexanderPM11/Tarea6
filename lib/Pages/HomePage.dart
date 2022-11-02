import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 11, 18),
      appBar: AppBar(
        title: const Text("Home Swiss knife"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Swiss knife",
          style: TextStyle(
              color: Color.fromARGB(255, 139, 149, 169),
              fontFamily: "GreatVibes",
              fontSize: 40,
              fontStyle: FontStyle.italic),
        ),
        Image.asset("assets/knif.png"),
      ]),
    );
  }
}
