import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class SecondoMolareInfDx extends StatefulWidget {
  const SecondoMolareInfDx({super.key});

  @override
  State<SecondoMolareInfDx> createState() => _SecondoMolareInfDx();
}

class _SecondoMolareInfDx extends State<SecondoMolareInfDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("47-Secondo Molare Inferiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}