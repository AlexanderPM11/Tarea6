import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<Weather> {
  String main = "";
  String description = "";
  String temp = "";
  String temp_min = "";
  String temp_max = "";
  String windSpeed = "";
  String humidity = "";
  String nameCountry = "";

  bool loading = true;
  bool showMessage = true;

  final myController = TextEditingController();

  void getWeather() async {
    final name = myController.text;
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${name}&appid=886705b4c1182eb1c69f28eb8c520e20"));
    Map data = jsonDecode(response.body);
    setState(() {
      main = data["weather"][0]["main"];
      description = data["weather"][0]["description"];
      temp = data["main"]["temp"].toString();
      temp_min = data["main"]["temp_min"].toString();
      temp_max = data["main"]["temp_max"].toString();
      windSpeed = data["wind"]["speed"].toString();
      nameCountry = data["name"];
      humidity = data["main"]["humidity"].toString();
    });
    print(humidity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 11, 18),
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.all(25),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: myController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter a country to see weather',
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
            onPressed: getWeather,
            child: const Text('Search'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25), //apply padding to all four sides
          child: Text("Weather in ${nameCountry}",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.all(19),
          padding: EdgeInsets.only(bottom: 25),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(255, 25, 29, 43),
          ),
          child: Column(children: [
            const Center(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 15), //apply padding to all four sides
                child: Text("Cielo:",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            Center(
              child: Text(main,
                  style: const TextStyle(
                    color: Colors.white,
                  )),
            ),
            const Center(
              child: Text("Descripción:",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text(description,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const Center(
              child: Text("Temperatura: ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text(temp,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const Center(
              child: Text("Temperatura maxima: ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text(temp_max,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const Center(
              child: Text("Temperatura minima: ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text(temp_min,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const Center(
              child: Text("Humedad: ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text(humidity,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const Center(
              child: Text("Velocidad del viento: ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text(windSpeed,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ]),
        )
      ]),
    );
  }
}
