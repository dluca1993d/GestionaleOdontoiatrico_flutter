import 'package:esercizi/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preventivi extends StatefulWidget {
  @override
  State<Preventivi> createState() => _Preventivi();
}

class _Preventivi extends State<Preventivi>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preventivi"),
         backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ));
  }
}