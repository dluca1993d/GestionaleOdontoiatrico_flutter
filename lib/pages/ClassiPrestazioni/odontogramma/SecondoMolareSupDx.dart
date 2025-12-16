import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class SecondoMolareSupDx extends StatefulWidget {
  const SecondoMolareSupDx({super.key});

  @override
  State<SecondoMolareSupDx> createState() => _SecondoMolareSupDx();
}

class _SecondoMolareSupDx extends State<SecondoMolareSupDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("17-Secondo Molare Superiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}