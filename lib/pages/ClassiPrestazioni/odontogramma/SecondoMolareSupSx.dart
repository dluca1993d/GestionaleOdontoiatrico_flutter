import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class SecondoMolareSupSx extends StatefulWidget {
  const SecondoMolareSupSx({super.key});

  @override
  State<SecondoMolareSupSx> createState() => _SecondoMolareSupSx();
}

class _SecondoMolareSupSx extends State<SecondoMolareSupSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("27-Secondo Molare Superiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}