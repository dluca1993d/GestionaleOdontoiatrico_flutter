import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TerzoMolareSupDx extends StatefulWidget {
  const TerzoMolareSupDx({super.key});

  @override
  State<TerzoMolareSupDx> createState() => _TerzoMolareSupDx();
}

class _TerzoMolareSupDx extends State<TerzoMolareSupDx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("18-Terzo Molare Superiore DX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),);
  }
}