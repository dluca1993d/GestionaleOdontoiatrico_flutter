import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class SecondoMolareInfSx extends StatefulWidget {
  const SecondoMolareInfSx({super.key});

  @override
  State<SecondoMolareInfSx> createState() => _SecondoMolareInfSx();
}

class _SecondoMolareInfSx extends State<SecondoMolareInfSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("37-Secondo Molare Inferiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}