import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class PrimoMolareInfSx extends StatefulWidget {
  const PrimoMolareInfSx({super.key});

  @override
  State<PrimoMolareInfSx> createState() => _PrimoMolareInfSx();
}

class _PrimoMolareInfSx extends State<PrimoMolareInfSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("36-Primo Molare Inferiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}