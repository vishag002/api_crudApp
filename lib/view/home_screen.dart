import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> decodedData = {};

  ///API
  fetchdata() async {
    final url = Uri.parse(
      //"https://catfact.ninja/fact"
      "https://api.coindesk.com/v1/bpi/currentprice.json",
    );
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);

    //

    //
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      setState(() {});
    } else {
      print("Invalid API");
    }
  }
  ////

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: decodedData.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(decodedData["time"]["updated"].toString()),
          subtitle: Text(decodedData["time"]["updateduk"].toString()),
          trailing: Text(decodedData["bpi"]["GBP"]["symbol"]),
        ),
      ),
    );
  }
}
