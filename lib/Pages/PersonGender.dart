// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PersonGender extends StatefulWidget {
  const PersonGender({super.key});

  @override
  State<PersonGender> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<PersonGender> {
  String _gender = "";
  bool loading = true;
  bool showMessage = true;
  final myController = TextEditingController();

  void setGender(String gender) {
    setState(() {
      _gender = gender;
    });
  }

  void getGender({String name = "gika"}) async {
    final name = myController.text;
    print(name);
    Response response =
        await get(Uri.parse("https://api.genderize.io/?name=${name}"));
    Map data = jsonDecode(response.body);
    setGender(data["gender"]);
    print(data["gender"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Person gender"),
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
            onPressed: () => getGender(),
            child: const Text('Search'),
          ),
        ),
        if (_gender != "")
          if (_gender == "female")
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 215, 7, 139),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              height: 60,
              child: Text("You are woman",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            )
          else
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 17, 38, 130),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              height: 60,
              child: Text("You are man",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            )
      ]),
    );
  }
}
