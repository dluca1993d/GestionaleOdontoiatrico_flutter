import 'package:shared_preferences/shared_preferences.dart';
import 'package:esercizi/pages/ClassiPrestazioni/odontogramma/pages-odontogramma.dart';
import 'package:flutter/material.dart';

class PrimoPremolareInfSx extends StatefulWidget {
  const PrimoPremolareInfSx({super.key});

  @override
  State<PrimoPremolareInfSx> createState() => _PrimoPremolareInfSx();
}

class _PrimoPremolareInfSx extends State<PrimoPremolareInfSx>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("34-Primo Premolare Inferiore SX"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}