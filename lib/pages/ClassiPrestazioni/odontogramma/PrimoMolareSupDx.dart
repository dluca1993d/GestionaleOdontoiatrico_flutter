import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class PrimoMolareSupDx extends StatefulWidget {
  const PrimoMolareSupDx({super.key});

  @override
  State<PrimoMolareSupDx> createState() => _PrimoMolareSupDx();
}

class _PrimoMolareSupDx extends State<PrimoMolareSupDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("16-Primo Molare Superiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}