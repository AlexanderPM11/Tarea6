// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PersonAge extends StatefulWidget {
  const PersonAge({super.key});

  @override
  State<PersonAge> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<PersonAge> {
  int _age = 0;
  bool loading = true;
  bool showMessage = true;
  final myController = TextEditingController();

  void setGender(int age) {
    setState(() {
      _age = age;
    });
  }

  void getAge() async {
    final name = myController.text;
    print(name);
    Response response =
        await get(Uri.parse("https://api.agify.io/?name=${name}"));
    Map data = jsonDecode(response.body);

    setGender(int.parse(data["age"].toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Person age"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.all(25),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: myController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please enter a name of person',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                  filled: true,
                  fillColor: Color.fromARGB(255, 23, 19, 37)),
            )),
        // ignore: avoid_unnecessary_containers
        Container(
          child: TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 15, 20, 25))),
            onPressed: () => getAge(),
            child: const Text('Search'),
          ),
        ),
        if (_age > 0 && _age < 110)
          if (_age <= 18)
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 36, 130, 17),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              height: 60,
              child: Text("Eres Joven",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold)),
            )
          else if (_age <= 59)
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 161, 227, 17),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              height: 60,
              child: Text("Eres Adulto",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            )
          else
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 235, 220, 10),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              height: 60,
              child: Text("Eres anciano",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            )
        else
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 219, 40, 5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            height: 60,
            child: Text("Error introduzca un numero entre: 1-110",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          )
      ]),
    );
  }
}
