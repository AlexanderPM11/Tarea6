import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SerchUniversity extends StatefulWidget {
  const SerchUniversity({super.key});

  @override
  State<SerchUniversity> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<SerchUniversity> {
  String _nameUniver = "";
  String _domain = "";
  String _linkPage = "";
  bool serch = false;
  bool loading = true;
  bool showMessage = true;
  int countUnivercity = 0;
  // ignore: deprecated_member_use
  late List<dynamic> dina;
  final myController = TextEditingController();

  void setUnivert(String univers) {
    setState(() {
      serch = true;
    });
  }

  void getAge() async {
    serch = true;
    final name = myController.text;
    Response response = await get(
        Uri.parse("http://universities.hipolabs.com/search?country=${name}"));
    var data = jsonDecode(response.body);
    dina = data;
    // setUnivert(name);
    // _domain = data[0]["domains"].toString();
    // _nameUniver = data[0]["name"].toString();
    // _linkPage = data[0]["web_pages"][0].toString();

    setState(() {
      serch = true;
    });
    setState(() {
      countUnivercity = dina.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("University"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.all(25),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: myController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please enter a university name',
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

        if (serch)
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: countUnivercity,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 25, 29, 43),
                    ),
                    margin: const EdgeInsets.all(8),
                    height: 200,
                    child: Column(children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 15), //apply padding to all four sides
                          child: Text("Name of univercity:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Center(
                        child: Text(dina[index]["name"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      const Center(
                        child: Text("Domain:",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Center(
                        child: Text(dina[index]["domains"].toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Center(
                        child: Text("Web page: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Center(
                        child: Text(dina[index]["web_pages"][0].toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ]),
                  );
                }),
          )
      ]),
    );
  }
}
