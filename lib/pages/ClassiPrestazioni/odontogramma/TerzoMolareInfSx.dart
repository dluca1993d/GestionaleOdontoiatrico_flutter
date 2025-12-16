import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class TerzoMolareInfSx extends StatefulWidget {
  const TerzoMolareInfSx({super.key});

  @override
  State<TerzoMolareInfSx> createState() => _TerzoMolareInfSx();
}

class _TerzoMolareInfSx extends State<TerzoMolareInfSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("38-Terzo Molare Inferiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}