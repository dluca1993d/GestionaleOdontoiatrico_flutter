import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class TerzoMolareSupSx extends StatefulWidget {
  const TerzoMolareSupSx({super.key});

  @override
  State<TerzoMolareSupSx> createState() => _TerzoMolareSupSx();
}

class _TerzoMolareSupSx extends State<TerzoMolareSupSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("28-Terzo Molare Superiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}