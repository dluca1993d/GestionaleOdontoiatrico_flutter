import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class SecondoPremolareSupSx extends StatefulWidget {
  const SecondoPremolareSupSx({super.key});

  @override
  State<SecondoPremolareSupSx> createState() => _SecondoPremolareSupSx();
}

class _SecondoPremolareSupSx extends State<SecondoPremolareSupSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("25-Secondo Premolare Sup. SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}