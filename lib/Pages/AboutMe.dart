import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 11, 18),
      appBar: AppBar(
        title: const Text("Portfolio"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Image.asset("assets/MyProfile.png"),
        const Text(
          "Alexander Polanco",
          style: TextStyle(
              color: Color.fromARGB(255, 139, 149, 169),
              fontFamily: "GreatVibes",
              fontSize: 40,
              fontStyle: FontStyle.italic),
        ),
        const Text(
          "Tel: (809) 916-0699",
          style: TextStyle(
              color: Color.fromARGB(255, 139, 149, 169),
              fontFamily: "GreatVibes",
              fontSize: 40,
              fontStyle: FontStyle.italic),
        ),
      ]),
    );
  }
}
