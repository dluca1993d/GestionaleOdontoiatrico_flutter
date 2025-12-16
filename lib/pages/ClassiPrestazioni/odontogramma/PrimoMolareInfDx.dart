import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class PrimoMolareInfDx extends StatefulWidget {
  const PrimoMolareInfDx({super.key});

  @override
  State<PrimoMolareInfDx> createState() => _PrimoMolareInfDx();
}

class _PrimoMolareInfDx extends State<PrimoMolareInfDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("46-Primo Molare Inferiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}