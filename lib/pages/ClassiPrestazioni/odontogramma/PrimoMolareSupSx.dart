import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class PrimoMolareSupSx extends StatefulWidget {
  const PrimoMolareSupSx({super.key});

  @override
  State<PrimoMolareSupSx> createState() => _PrimoMolareSupSx();
}

class _PrimoMolareSupSx extends State<PrimoMolareSupSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("26-Primo Molare Superiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}