import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TerzoMolareInfDx extends StatefulWidget {
  const TerzoMolareInfDx({super.key});

  @override
  State<TerzoMolareInfDx> createState() => _TerzoMolareInfDx();
}

class _TerzoMolareInfDx extends State<TerzoMolareInfDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("48-Terzo Molare Inferiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}